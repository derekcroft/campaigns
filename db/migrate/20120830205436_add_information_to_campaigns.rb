class AddInformationToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :name, :string
    add_column :campaigns, :subdomain, :string
    add_column :campaigns, :ends_on, :date

  end
end
