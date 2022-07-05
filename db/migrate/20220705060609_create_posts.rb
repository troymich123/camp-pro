class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer,      :category_id,         null: false
      t.integer,      :brand_id,            null: false
      t.integer,      :model_id,            null: false
      t.string,       :text,                null: false
      t.timestamps
    end
  end
end
