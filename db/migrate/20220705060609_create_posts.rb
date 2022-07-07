class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer       :category_id,         null: false
      t.integer       :brand_id,            null: false
      t.string        :gearmodel,           null: false
      t.text          :text,                null: false
      t.references    :user,                null: false, foreign_key:true
      t.timestamps
    end
  end
end
