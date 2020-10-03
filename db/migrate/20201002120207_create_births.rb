class CreateBirths < ActiveRecord::Migration[6.0]
  def change
    create_table :births do |t|
      t.references :user,   null: false, foreign_key: true
      t.string :plan_name,  null: false
      t.text    :thought ,  null: false
      t.integer :hope_id,   null: false
      t.integer :attend_id, null: false
      t.text :contraction
      t.text :childbirth
      t.integer :Breastfeeding_id, null: false
      t.text :postpartum
      t.text :memo
      t.timestamps
    end
  end
end
