class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :rank, :integer, default: 1
    add_column :users, :rank_name, :string, default: "ルーキーⅣ"
    add_column :users, :exp_point, :integer, default: 0
  end
end
