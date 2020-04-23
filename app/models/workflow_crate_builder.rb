require 'ro_crate_ruby'
require 'open-uri'

class WorkflowCrateBuilder
  include ActiveModel::Model

  attr_accessor :workflow, :abstract_cwl, :diagram, :workflow_extractor

  validates :workflow, presence: true
  validate :resolve_remotes
  validate :workflow_data_present

  def build
    if valid?
      Rails.logger.info("Making new RO Crate")
      crate = ROCrate::WorkflowCrate.new
      crate.main_workflow = ROCrate::Workflow.new(crate, workflow[:data], get_unique_filename(crate, workflow[:data]))
      crate.main_workflow.programming_language = crate.add_contextual_entity(ROCrate::ContextualEntity.new(crate, nil, workflow_extractor.ro_crate_metadata))
      crate.main_workflow['url'] = workflow[:data_url] if workflow[:data_url].present?
      if diagram[:data].present?
        crate.main_workflow.diagram = ROCrate::WorkflowDiagram.new(crate, diagram[:data], get_unique_filename(crate, diagram[:data]))
        crate.main_workflow.diagram['url'] = diagram[:data_url] if diagram[:data_url].present?
      end

      if abstract_cwl[:data].present?
        crate.main_workflow.cwl_description = ROCrate::WorkflowDescription.new(crate, abstract_cwl[:data], get_unique_filename(crate, abstract_cwl[:data]))
        crate.main_workflow.cwl_description['url'] = abstract_cwl[:data_url] if abstract_cwl[:data_url].present?
      end
      crate.preview.template = WorkflowExtraction::PREVIEW_TEMPLATE

      f = Tempfile.new('crate.zip')
      f.binmode

      Rails.logger.info("Writing crate to #{f.path}")
      ROCrate::Writer.new(crate).write_zip(f)
      f.rewind

      return { tmp_io_object: f,
        original_filename: 'new-workflow.basic.crate.zip',
        content_type: 'application/zip',
        make_local_copy: true,
        file_size: File.size(f) }
    end

    nil
  end

  private

  def resolve_remotes
    [:workflow, :abstract_cwl, :diagram].each do |attr|
      val = send(attr)
      if val[:data].blank? && val[:data_url].present?
        begin
          handler = ContentBlob.remote_content_handler_for(val[:data_url])
          val[:data] = handler.fetch
        rescue Seek::DownloadHandling::BadResponseCodeException => e
          errors.add(attr, "URL could not be accessed: #{e.message}")
          return false
        rescue StandardError => e
          raise e unless Rails.env.production?
          Rails.logger.error("#{e} occurred whilst trying to fetch: #{val[:data_url]}\n\t#{e.backtrace.join("\n\t")}")
          errors.add(attr, "URL could not be accessed")
          return false
        end
      end
    end

    true
  end

  def workflow_data_present
    if workflow[:data].blank?
      errors.add(:workflow, 'should be provided as a file or remote URL')
    end
  end

  def get_unique_filename(crate, io)
    begin
      filename = io.respond_to?(:original_filename) ? io.original_filename : io.base_uri.path.split('/').last

      n = 0
      filename = "#{n += 1}_#{original_filename}" while crate.dereference(filename)

      filename
    rescue StandardError => e
      Rails.logger.error("#{e} occurred trying to generate filename for #{io}")
      nil # A UUID filename should be generated by the crate lib if given `nil`
    end
  end
end