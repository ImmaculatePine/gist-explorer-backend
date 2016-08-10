class CreateGistLabels < ActiveRecord::Migration
  def change
    create_table :gist_labels do |t|
      t.string :gist_id
      t.references :label, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :gist_labels, :gist_id
    add_index :gist_labels, [:gist_id, :label_id], unique: true
  end
end
