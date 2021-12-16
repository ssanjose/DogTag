class Owner < ApplicationRecord
  has_many :dogs

  has_one_attached :picture

  validates :name, :age, presence: true
end
