class Course < ApplicationRecord
  belongs_to :coach
  has_many :activities, dependent: :destroy

  validates_presence_of :name
end
