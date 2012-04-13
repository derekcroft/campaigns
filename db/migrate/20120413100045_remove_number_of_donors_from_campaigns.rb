class RemoveNumberOfDonorsFromCampaigns < ActiveRecord::Migration
  def change
    remove_column :campaigns, :number_of_donors
  end
end
