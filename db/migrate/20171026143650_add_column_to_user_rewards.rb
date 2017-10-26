class AddColumnToUserRewards < ActiveRecord::Migration[5.1]
  def change
		add_column :user_rewards, :user_id, :integer
		add_column :user_rewards, :reward_id, :integer
  end
end
