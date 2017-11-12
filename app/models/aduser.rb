class Aduser < ApplicationRecord
  belongs_to :adkisei
  belongs_to :account
  
  validates :name, presence: true
  validates :adkisei_id, presence: true

  mount_uploader :avator, ImageUploader
end
