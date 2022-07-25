class CreateRankSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :rank_settings do |t|
      t.integer :rank
      t.string :rank_name
      t.integer :threshold

      t.timestamps
    end
  end
end
