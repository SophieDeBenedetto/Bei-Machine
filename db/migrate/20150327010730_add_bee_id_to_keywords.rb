class AddBeeIdToKeywords < ActiveRecord::Migration
  def change
    add_column :keywords, :bee_id, :integer
  end
end
