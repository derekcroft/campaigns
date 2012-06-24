class ChangeDonationTarget < ActiveRecord::Migration
  def up
    Campaign.last.update_attribute(:donation_target, BigDecimal.new("2500"))
  end

  def down
    Campaign.last.update_attribute(:donation_target, BigDecimal.new("50000"))
  end
end
