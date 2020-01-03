class AddNetworkToShows < ActiveRecord::Migration[6.0]
  def change
    add_column :shows, :network_name, :string
    add_column :shows, :link, :string
  end
end
