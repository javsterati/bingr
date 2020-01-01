class AddImageToShows < ActiveRecord::Migration[6.0]
  def change
    add_column :shows, :image, :string
  end
end
