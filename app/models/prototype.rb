class Prototype < ApplicationRecord
  validates :title, :catch_copy, :concept, presence: true
  belongs_to :user
  has_many :comments
end
