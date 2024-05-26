class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.text :message
      t.integer :label
      t.string :emoji
      t.decimal :score

      t.timestamps
    end
  end
end
