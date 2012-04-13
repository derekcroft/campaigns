class Donor < ActiveRecord::Base
  belongs_to :campaign

  def donation_amount
    0
  end
end
