class Birth < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :hope
  belongs_to_active_hash :attend

  with_options presence: true do
    validates :plan_name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :hope_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :attend_id, numericality: { other_than: 0, message: 'を選択してください' }
  end

end