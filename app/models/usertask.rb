class Usertask < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :status, presence: true, length: { maximum: 25 }
  validates :content, presence: true, length: { maximum: 255 }
end
