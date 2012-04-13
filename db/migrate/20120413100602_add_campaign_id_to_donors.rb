class AddCampaignIdToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :campaign_id, :integer
  end
end
