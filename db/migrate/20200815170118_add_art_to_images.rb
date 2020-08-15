class AddArtToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :art, :string
  end
end
