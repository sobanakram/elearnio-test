class Coach < ApplicationRecord
  has_many :courses

  validates_presence_of :name
end
