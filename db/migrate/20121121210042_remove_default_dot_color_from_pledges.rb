class RemoveDefaultDotColorFromPledges < ActiveRecord::Migration
  def up
    change_column :pledges, :dot_color, :string, limit: 7, default: nil
  end

  def down
    change_column :pledges, :dot_color, :string, limit: 7, default: "#000000"
  end
end
