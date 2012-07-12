class AddPaymentFieldsToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :processed_at, :datetime
    add_column :pledges, :confirmation_email_at, :datetime
    add_column :pledges, :stripe_response, :text
  end
end
