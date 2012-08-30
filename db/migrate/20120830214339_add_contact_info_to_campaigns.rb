class AddContactInfoToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :contact_name, :string
    add_column :campaigns, :contact_email, :string
    add_column :campaigns, :contact_phone, :string
    Campaign.find_by_subdomain('chi').update_attributes(
      contact_name: 'Fred Bear',
      contact_email: 'freddy@kiindly.com',
      contact_phone: '3133342344'
    )
  end
end
