class AddNotesToBees < ActiveRecord::Migration
  def change
    add_column :bees, :notes, :text
  end
end
