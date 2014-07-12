class AddDefaultToStepsUser < ActiveRecord::Migration
	def up
		change_column :users, :steps_today, :integer, default: 0
		change_column :users, :steps_month, :integer, default: 0
	end
	def down
		change_column :users, :steps_today, :integer, default: nil
		change_column :users, :steps_month, :integer, default: nil
	end
end
