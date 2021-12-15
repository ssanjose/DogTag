class Owner < ApplicationRecord
  validates :name, :age, presence: true
end
