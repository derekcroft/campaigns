module PledgesHelper
  def donation_type_text(pledge)
    pledge.pledge_type == 'fixed' ? "Fixed Amount" : "Penny Pledge"
  end

  def donor_number(campaign)
    number_with_delimiter campaign.donors.count, precision: 0, delimiter: ','
  end

  def pledge_description(pledge)
    if pledge.pledge_type == 'penny'
      "Penny Pledge"
    else
      "Fixed Donation of #{number_to_currency(pledge.amount, precision: 0)}"
    end
  end

  def left_column(pledge, action)
    if action == :new
      render partial: "pledges/#{@campaign.subdomain}/pledge", object: pledge
    else
      render "pledges/#{@campaign.subdomain}/thank_you"
    end
  end

  def teams_and_charities
    Team.order(:name).uniq.collect { |team|
      "#{team.name} / #{team.charity}"
    }
  end

  def sports
    Team.select(:sport).order(:sport).uniq.collect(&:sport)
  end

  def us_states
    # remove AK, AZ, DC, and WA because OUAA cannot solicit there
    [
      ['Alabama', 'AL'],
      ['Arkansas', 'AR'],
      ['California', 'CA'],
      ['Colorado', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Puerto Rico', 'PR'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY']
    ]
  end
end
