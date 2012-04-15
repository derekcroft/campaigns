class AddFieldsToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :first_name, :string

    add_column :donors, :last_name, :string

    add_column :donors, :email, :string

    add_column :donors, :street_address, :string

    add_column :donors, :city, :string

    add_column :donors, :state, :string, limit: 2

    add_column :donors, :zip, :string, limit: 9

    add_column :donors, :phone, :string, limit: 10

  end
end
