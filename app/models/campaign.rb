class Campaign < ActiveRecord::Base

  has_many :donors
  has_many :pledges

  validates :donation_target, :match_amount, presence: true
  validates :subdomain, uniqueness: true

  def number_of_eligible_pledges
    self.class.where(id: self.id).joins(donors: :pledges).count(:donor_id, distinct: true)
  end

  def donation_total_complete_percent
    return 0 if donation_total.nil?
    [(donation_total/donation_target*100).round.to_i, 100].min
  end

  def donor_total_complete_percent
    return 0 if donors.blank?
    [(donors.count/donor_target*100).round.to_i, 100].min
  end

  def days_left
    (ends_on - Date.today).to_i
  end

  def donation_total
    fixed_total + matching_total
  end

  def description
    campaign_type == 'dollar' ?  'Dollar Match' : ''
  end

  def stretch_goal
    return 0 unless donor_target
    (donor_target * 1.25).ceil
  end

  private
  def fixed_total
    total_row = pledges.where(pledge_type: 'fixed').group("campaign_id").sum(:amount)
    fixed_sum = total_row.fetch(self[:id], BigDecimal.new('0'))

    total_row = pledges.where("pledge_type <> 'fixed' and donate_cap = true").group("campaign_id").sum(:cap)
    fixed_sum += total_row.fetch(self[:id], BigDecimal.new('0'))
  end

  def matching_total
    total_row = Campaign.connection.select_all(%{
      select
      sum(
        least(
          #{self.match_amount*0.01}*(
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
      where c.id = #{self[:id]}
      and penny_p.pledge_type <> 'fixed'
      and penny_p.donate_cap = false
      group by c.id
    }).first
    BigDecimal.new(total_row ? total_row['penny_total'] : 0)
  end

end
