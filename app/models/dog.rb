class Dog < ApplicationRecord
  belongs_to :owner
  has_many :breed_dogs

  has_one_attached :image

  validates :name, :age, :size, presence: true
  validates :name, uniqueness: true
  validates :likes, numericality: true
end
