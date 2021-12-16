class Breed < ApplicationRecord
  has_many :sub, class_name:  "Breed",
                 foreign_key: "parent_id"
  has_many :breed_dogs

  belongs_to :parent, class_name: "Breed", optional: true

  validates :title, presence: true
end
