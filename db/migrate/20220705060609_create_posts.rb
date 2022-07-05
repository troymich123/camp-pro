class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer       :category_id,         null: false
      t.integer       :brand_id,            null: false
      t.integer       :gearmodel_id,        null: false
      t.string        :text,                null: false
      t.references    :user,                null: false, foreign_key:true
      t.timestamps
    end
  end
end
