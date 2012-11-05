class AddMatchAmountToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :match_amount, :integer, default: 1

  end
end
