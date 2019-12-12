class Task < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 20 }
  validates :description, length: { maximum: 300 }
end
