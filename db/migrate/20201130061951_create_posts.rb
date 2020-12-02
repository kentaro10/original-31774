class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string  :title,       null: false
      t.integer :genre_1_id,   null: false
      t.integer :genre_2_id,   null: false
      t.string  :shop_name
      t.text    :explanation
      t.integer :self_assessment_id
      t.references :user,   foreign_key: true


      t.timestamps
    end
  end
end
