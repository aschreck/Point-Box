class AddPointsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :available_points, :integer, default: 1000
    add_column :users, :spent_points,     :integer, default: 0
    add_column :users, :role,             :integer, default: 0
  end
end
