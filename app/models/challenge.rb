class Challenge < ApplicationRecord
  belongs_to :category
  has_many :activities, dependent: :destroy


  validates :name, presence: true


end
