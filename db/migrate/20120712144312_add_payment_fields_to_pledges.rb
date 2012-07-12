class AddPaymentFieldsToPledges < ActiveRecord::Migration
  def change
    add_column :donors, :processed_at, :datetime

    add_column :donors, :confirmation_email_at, :datetime
    add_column :donors, :stripe_response, :text
  end
end
