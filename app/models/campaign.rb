class Campaign < ActiveRecord::Base

  has_many :donors
  has_many :pledges

  validates :donation_target, presence: true

  def number_of_eligible_pledges
    Campaign.where(id: self.id).joins(donors: :pledges).count(:donor_id, distinct: true)
  end

  def percent_complete
    return 0 if donation_total.nil?
    [(donation_total/donation_target*100).round.to_i, 100].min
  end

  def donation_total
    donors.sum(&:donation_amount) || 0
  end

end
