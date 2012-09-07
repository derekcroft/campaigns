class AddStartsOnToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :starts_on, :date
    Campaign.find_by_subdomain('chi').update_attributes(
        starts_on: Date.new(2012, 9, 30)
    )
  end
end
