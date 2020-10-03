class CreateBirths < ActiveRecord::Migration[6.0]
  def change
    create_table :births do |t|
      t.references :user,   null: false, foreign_key: true
      t.string :plan_name,  null: false
      t.text :description,  null: false
      t.integer :hope_id,   null: false
      t.integer :attend_id, null: false
      t.text :contraction
      t.text :required_time
      t.text :childbirth
      t.text :postpartum
      t.text :memo
      t.timestamps
    end
  end
end
