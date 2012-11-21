class Pledge < ActiveRecord::Base

  belongs_to :donor, autosave: true
  belongs_to :campaign

  accepts_nested_attributes_for :donor

  attr_accessor :stripe_card_token
  attr_accessible :stripe_card_token, :pledge_type, :amount,
    :cap, :donor_attributes, :donate_cap, :dot_color, :dot_comment

  validates :pledge_type, inclusion: { in: %w{fixed penny dollar} }
  validates :donor, :campaign, presence: true
  validates :donor, associated: true
  validates :cap, numericality: { greater_than_or_equal_to: 20, less_than_or_equal_to: 1000 }

  scope :fixed, where(["pledge_type = 'fixed' or donate_cap = ?", true])
  scope :matching, where("pledge_type <> 'fixed'").where(donate_cap: false)
  
  scope :donate_cap, where(donate_cap: true)

  scope :resend, -> { where(pledge_type: 'fixed').where('amount <> 10').
                      joins(:donor).where('donors.confirmation_correction_at is null').
                      where('donors.processed_at is not null') }

  def self.correction_email_list
    resend.pluck('donors.email')
  end

  after_initialize :set_defaults
  def set_defaults
    self.pledge_type ||= 'penny'
    self.donate_cap ||= false
    self.donor ||= build_donor
    self.dot_color ||= Pledge.random_hex
    self.cap ||= 20
  end

  before_validation :set_campaign
  def set_campaign
    self.campaign ||= donor.campaign
  end

  def self.random_hex
    hex_values = ('0'..'9').to_a+('a'..'f').to_a
    6.times.inject('#') { |str, elem| str << hex_values.sample }
  end

end
