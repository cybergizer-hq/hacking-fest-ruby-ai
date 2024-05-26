class AddHeaderToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :header, :string
  end
end
