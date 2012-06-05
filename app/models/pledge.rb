class Pledge < ActiveRecord::Base

  belongs_to :donor, autosave: true
  belongs_to :campaign

  accepts_nested_attributes_for :donor

  attr_accessor :stripe_card_token
  attr_accessible :stripe_card_token, :pledge_type, :amount, :cap, :donor_attributes

  validates :pledge_type, inclusion: { in: %w{fixed penny} }
  validates :donor, :campaign, presence: true
  validates :donor, associated: true

  scope :penny, where(pledge_type: 'penny')
  scope :fixed, where(pledge_type: 'fixed')

  after_initialize :set_defaults
  def set_defaults
    self.pledge_type ||= 'penny'
    self.donor ||= build_donor
    self.cap ||= 20
  end

  before_validation :set_campaign
  def set_campaign
    self.campaign ||= donor.campaign
  end

end
