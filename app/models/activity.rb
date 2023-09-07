class Activity < ApplicationRecord
  belongs_to :challenge
  # after_save :activity_created

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 1 }
  
end
