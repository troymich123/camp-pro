class AddColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :price, :integer
    add_column :posts, :url, :text
    add_column :posts, :purchase_date, :date
    add_column :posts, :release_date, :date
  end
end
