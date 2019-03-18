class Picture < ApplicationRecord
  mount_uploader :image,ImageUploader
  belongs_to :user
  validates :title,presence: true,length:{maximum:255}
  validates :comment,presence: true,length:{maximum:1000}
end
