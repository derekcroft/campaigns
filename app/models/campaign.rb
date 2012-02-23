class Campaign < ActiveRecord::Base
  def percent_complete
    return 0 if donation_total.nil?
    [(BigDecimal.new(donation_total)/BigDecimal.new(donation_target)*100).round.to_i, 100].min
  end
end
