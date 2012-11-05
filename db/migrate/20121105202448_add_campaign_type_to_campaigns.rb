class AddCampaignTypeToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :campaign_type, :string, default: 'penny'

  end
end
