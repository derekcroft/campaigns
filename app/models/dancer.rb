require 'csv'

class Dancer < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :confirmation, :confirmed_at, :email, :first_name, :last_name, :state, :zip

  has_many :pledges

  validates :last_name, uniqueness: { scope: :first_name }
  validates :sequence, presence: true

  before_validation :set_sequence, on: :create

  class << self
    def import!
      CSV.foreach(File.join(Rails.root, 'db',  'msudm', 'msudm_dancers.csv'), headers: :first_row) do |row|
        Dancer.where(confirmation: row['Confirmation']).first_or_create(
          first_name: row['FirstName'].titleize,
          last_name: row['LastName'].titleize,
          email: row['E-Mail'],
          address1: row['Address1'],
          address2: row['Address1'],
          city: row['City'],
          state: row['State'],
          zip: row['Zip'],
          confirmed_at: parse_date(row['ConfirmationDate']),
        )
      end
    end

    def parse_date(str)
      DateTime.strptime(str, "%D %R")
    end

    def dropdown_order
      order(:last_name, :first_name).all.collect {|t| ["#{t.last_name},  #{t.first_name}", t.id]}
    end

    def leaders
      []#select("name, charity, sport, count(pledges.id) as num_donors, sum(pledges.cap) as amount_raised").joins(:pledges).group('name, charity, sport').order('num_donors desc')
    end
  end

  def subdomain
    url.split('/').last
  end

  def set_sequence
    self.sequence = Dancer.unscoped.count + 1
  end
end
