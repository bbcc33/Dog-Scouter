class AddUserIdToCities < ActiveRecord::Migration[7.1]
  def change
    add_reference :cities, :user, foreign_key: true, null: true # Allow NULL values
  end
end
