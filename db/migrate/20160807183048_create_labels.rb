class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
    add_index :labels, :name
    add_index :labels, [:user_id, :name], unique: true
  end
end
