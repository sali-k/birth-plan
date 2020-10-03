class Birth < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :plan_name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :hope_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :attend_id, numericality: { other_than: 0, message: 'を選択してください' }
end
