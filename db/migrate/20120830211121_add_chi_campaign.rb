class AddChiCampaign < ActiveRecord::Migration
  def up
    Campaign.create(
      donation_target: 2500,
      ends_on: Date.new(2012, 10, 31),
      name: 'Healthy Chicago Initiative',
      subdomain: 'chi'
    )
  end

  def down
    Campaign.where(subdomain: 'chi').delete_all
  end
end
