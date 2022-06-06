class Activity < ApplicationRecord
  has_one_attached :portrait
  has_many :activity_services,  dependent: :destroy
  has_many :services, through: :activity_services
  validates :title, presence: true
  validates :leader_name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :suggestion_summary, presence: true
  validates :suggestion_detail, presence: true
  validate :ended_at_validation
end

def ended_at_validation
  errors.add(:ended_at, 'は開始日時以降を指定してください。') if started_at && ended_at && started_at > ended_at
end
