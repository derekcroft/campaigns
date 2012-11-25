class ChangeStartAndEndDateOnCampaigns < ActiveRecord::Migration
  def up
    Campaign.find_by_subdomain('chi').update_attributes!(
      starts_on: Date.new(2012, 11, 26),
      ends_on: Date.new(2012, 12, 24)
    )
  end
end
