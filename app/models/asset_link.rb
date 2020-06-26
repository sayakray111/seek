class AssetLink < ApplicationRecord
  DISCUSSION = 'discussion'.freeze

  scope :discussion, -> { where(link_type: AssetLink::DISCUSSION) }

  belongs_to :asset, polymorphic: true
  validates :url, url: { allow_nil: false }
  validates :label, length: {maximum: 70}
  validates :asset, presence: true

  def display_label
    label.blank? ? url : label
  end
end
