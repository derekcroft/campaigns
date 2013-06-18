class AddStartsOnToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :starts_on, :date
  end
end
