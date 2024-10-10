class AddIsSeededToCities < ActiveRecord::Migration[7.1]
  def change
    add_column :cities, :is_seeded, :boolean, default: false
  end
end
