class AddDonateBonusToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :donate_bonus, :boolean
  end
end
