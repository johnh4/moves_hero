class AddTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :moves_token, :string
  end
end
