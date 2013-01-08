class UpdateEndsOnForCampaigns < ActiveRecord::Migration
  def up
    Campaign.find_by_subdomain("chi").update_attribute(:ends_on, Date.new(2013, 2, 7))
  end

  def down
  end
end
