class BreedDog < ApplicationRecord
  belongs_to :breed
  belongs_to :dog
end
