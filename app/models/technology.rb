class Technology < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }

  # has_many :works_technologies, dependent: :destroy
  # has_many :works, through: :works_technologies
end
