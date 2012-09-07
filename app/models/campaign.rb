class Campaign < ActiveRecord::Base

  has_many :donors
  has_many :pledges

  validates :donation_target, presence: true

  def number_of_eligible_pledges
    self.class.where(id: self.id).joins(donors: :pledges).count(:donor_id, distinct: true)
  end

  def percent_complete
    return 0 if donation_total.nil?
    [(donation_total/donation_target*100).round.to_i, 100].min
  end

  def days_left
    (ends_on - Date.today).to_i
  end

  def donation_total
    fixed_total + penny_total
  end

  def fixed_total
    total_row = pledges.where(pledge_type: 'fixed').group("campaign_id").sum(:amount)
    total_row.fetch(self[:id], BigDecimal.new('0'))
  end

  def penny_total
    total_row = Campaign.connection.select_all(%{
      select
      sum(
        least(
          0.01*(
            select count(*) 
            from donors d
            where campaign_id = c.id
          ),
          penny_p.cap
        )
      ) as penny_total
      from campaigns c
      inner join pledges penny_p
      on penny_p.campaign_id = c.id
      and penny_p.pledge_type = 'penny'
      where c.id = #{self[:id]}
      group by c.id
    }).first
    BigDecimal.new(total_row ? total_row['penny_total'] : 0)
  end

end
