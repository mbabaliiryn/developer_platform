class Project < ApplicationRecord
  belongs_to :user
  has_many :groups, dependent: :destroy
  scope :alphabetical, -> { order(name: :asc) }
  validates :name, presence: true, length: { minimum: 3, maximum: 55 }
end
