class AddContactInfoToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :contact_name, :string
    add_column :campaigns, :contact_email, :string
    add_column :campaigns, :contact_phone, :string
  end
end
