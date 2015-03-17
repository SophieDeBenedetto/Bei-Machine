class AddUserToBees < ActiveRecord::Migration
  def change
    add_column :bees, :user_id, :integer
  end
end
