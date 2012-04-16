class Donor < ActiveRecord::Base

  belongs_to :campaign
  has_many :pledges

  validates :campaign, :street_address, :city, :state, :zip, presence: true
  validates :email, format: { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }, presence: true

  def donation_amount
    fixed_pledge_amount + penny_pledge_amount
  end


  private
  def fixed_pledge_amount
    pledges.fixed.sum(:amount) || 0
  end

  def penny_pledge_amount
    pledges.penny.sum do |pledge|
      [(0.01 * campaign.number_of_eligible_pledges), (pledge.cap || 50.00)].min
    end
  end

end
