class Pledge < ActiveRecord::Base

  belongs_to :donor
  belongs_to :campaign

  attr_accessible :stripe_card_token, :pledge_type, :amount, :cap

  validates :pledge_type, inclusion: { in: %w{fixed penny} }
  validates :donor, :campaign, presence: true

  scope :penny, where(pledge_type: 'penny')
  scope :fixed, where(pledge_type: 'fixed')

  before_validation :set_campaign
  def set_campaign
    self.campaign ||= donor.campaign
  end
end
