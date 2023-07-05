class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy # Added to associate comments to Restaurant

  validates :name, presence: true, uniqueness: true
end
