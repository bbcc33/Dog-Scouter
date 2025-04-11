class ChangeUserIdToNotNullInCities < ActiveRecord::Migration[7.1]
  def change
    change_column_null :cities, :user_id, false # Enforce NOT NULL constraint
  end
end
