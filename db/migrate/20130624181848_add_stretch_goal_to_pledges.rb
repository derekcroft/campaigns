class AddStretchGoalToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :stretch_goal_donors, :integer
    add_column :pledges, :stretch_goal_amount, :decimal, precision: 10, scale: 2
  end
end
