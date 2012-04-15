class AddStripeCustomerToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :stripe_customer, :text

  end
end
