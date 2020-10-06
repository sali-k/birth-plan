class Birth < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments, dependent: :destroy
  belongs_to_active_hash :hope
  belongs_to_active_hash :attend
  belongs_to_active_hash :breastfeeding

  with_options length: { maximum: 1000 } do
    validates :contraction
    validates :childbirth
    validates :postpartum
    validates :memo
  end

  with_options presence: true do
    validates :plan_name, length: { maximum: 40 }
    validates :thought, length: { maximum: 1000 }
    validates :hope_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :attend_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :breastfeeding_id, numericality: { other_than: 0, message: 'を選択してください' }
  end

  def feed_comment(birth_id)
    Comment.where("birth_id = ?", birth_id)
  end
end
