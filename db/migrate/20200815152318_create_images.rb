class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :title
      t.belongs_to :user

      t.timestamps
    end
  end
end
