class AddImageToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :image, :string
  end
end