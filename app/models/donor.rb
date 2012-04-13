class Donor < ActiveRecord::Base

  belongs_to :campaign
  has_many :pledges

  validates :campaign, presence: true

  def donation_amount
    fixed_pledge_amount + penny_pledge_amount
  end

  private
  def fixed_pledge_amount
    pledges.where(pledge_type: 'fixed').sum(:amount) || 0
  end

  def penny_pledge_amount
    if pledges.where(pledge_type: 'penny').exists?
      (0.01 * campaign.donors.count)
    else
      0
    end
  end

end
