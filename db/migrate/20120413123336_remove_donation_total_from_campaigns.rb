class RemoveDonationTotalFromCampaigns < ActiveRecord::Migration
  def change
    remove_column :campaigns, :donation_total
  end

end
