class AddStepsColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :steps_today, :integer
    add_column :users, :steps_month, :integer
  end
end
