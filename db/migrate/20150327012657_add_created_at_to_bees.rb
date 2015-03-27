class AddCreatedAtToBees < ActiveRecord::Migration
  def change
    add_column :bees, :created_at, :datetime
  end
end
