class AddDonorTargetToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :donor_target, :integer
  end
end
