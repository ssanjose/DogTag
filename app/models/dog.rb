class Dog < ApplicationRecord
  belongs_to :owner

  validates :name, :age, :size, presence: true
  validates :likes, numericality: true
end
