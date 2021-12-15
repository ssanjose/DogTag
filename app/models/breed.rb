class Breed < ApplicationRecord
  has_many :sub, class_name:  "Breed",
                 foreign_key: "sub_id"

  belongs_to :parent, class_name: "Breed", optional: true

  validates :title, presence: true
end
