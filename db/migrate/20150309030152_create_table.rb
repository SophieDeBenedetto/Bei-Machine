class CreateTable < ActiveRecord::Migration
  def change
    create_table :bees do |t|
      t.string :result_item
      t.string :link
    end
  end
end
