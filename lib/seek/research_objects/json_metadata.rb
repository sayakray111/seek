module Seek
  module ResearchObjects
    # creates the JSON metadata content describing an item to be stored in a Research Object
    class JSONMetadata < Metadata
      include Singleton

      CANDIDATE_PROPERTIES = [:title, :description, :assay_type_uri, :technology_type_uri,
                              :version, :doi, :doi_uri, :pubmed_id, :pubmed_uri]

      def metadata_content(item, parents = [])
        json = { id: item.id, uri: item_uri(item) }
        CANDIDATE_PROPERTIES.each do |method|
          json[method] = item.send(method) if item.respond_to?(method)
        end

        json[:contributor] = create_agent(item.contributor)

        json[:creators] = item.creators.map { |p| create_agent(p) } if item.respond_to?(:creators)

        if item.is_a?(Investigation)
          json[:studies] = item.studies.select { |s| s.permitted_for_research_object? }.map do |s|
            s.research_object_package_path(parents + [item])
          end
        elsif item.is_a?(Study)
          json[:assays] = item.assays.select { |a| a.permitted_for_research_object? }.map do |a|
            a.research_object_package_path(parents + [item])
          end
        elsif item.is_a?(Assay)
          json[:assets] = contained_assets(item)
        elsif item.is_asset?
          json[:contains] = contained_files(item)
        end

        JSON.pretty_generate(json)
      end

      def metadata_filename
        'metadata.json'
      end

      private

      def contained_assets(assay)
        assets = assay.assets.select{|asset| asset.permitted_for_research_object?}
        assets.collect do |asset|
          asset.research_object_package_path([assay])
        end
      end

      def contained_files(asset)
        contained_blobs(asset) | contained_model_images(asset)
      end

      def contained_model_images(asset)
        if asset.respond_to?(:model_image) && asset.model_image
          [File.join(asset.research_object_package_path,
                     asset.model_image.original_filename)]
        else
          []
        end
      end

      def contained_blobs(asset)
        asset.all_content_blobs.collect do |blob|
          if blob.file_exists?
            File.join(asset.research_object_package_path, blob.original_filename)
          elsif blob.url
            blob.url
          end
        end.compact
      end
    end
  end
end
