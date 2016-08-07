class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :token, :string

    add_index :users, :provider
    add_index :users, :uid
    add_index :users, :token
    add_index :users, [:provider, :uid], unique: true
    add_index :users, [:provider, :token], unique: true
  end
end
