class Group < ApplicationRecord
    belongs_to :user
    has_many :tasks, dependent: :destroy
    belongs_to :project, optional: true
    scope :alphabetical, -> { order(name: :asc) }
    validates :name, presence: true, length: { minimum: 3, maximum: 50 }
    def self.font_awesome_list
        file = File.open('font_awesome_list.txt')
        file_data = file.read
        file_data.split(',')
    end
end
