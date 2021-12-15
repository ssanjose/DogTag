class Owner < ApplicationRecord
  has_many :dogs

  validates :name, :age, presence: true
end
