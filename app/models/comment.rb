class Comment < ApplicationRecord
  validates :user_id, presence: true
  validates :birth_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }
end
