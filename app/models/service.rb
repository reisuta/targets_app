class Service < ApplicationRecord
  has_many :activity_services, dependent: :destroy
  has_many :activities, through: :activity_services

  validates :name, presence: true, length: { maximum: 30 }
end
