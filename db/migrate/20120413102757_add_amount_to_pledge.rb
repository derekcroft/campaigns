class AddAmountToPledge < ActiveRecord::Migration
  def change
    add_column :pledges, :amount, :decimal, precision: 10, scale: 2

  end
end
