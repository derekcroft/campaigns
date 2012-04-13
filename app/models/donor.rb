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
    pledges.where(pledge_type: 'penny').inject(0) do |sum, pledge|
      sum + [(0.01 * campaign.donors.count), (pledge.cap || 50.00)].min
    end
  end

end
