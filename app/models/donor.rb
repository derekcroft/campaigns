class Donor < ActiveRecord::Base
  belongs_to :campaign
  has_many :pledges

  def donation_amount
    pledges.sum(:amount)
  end
end
