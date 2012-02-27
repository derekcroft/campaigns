def currency_to_i(amount)
  amount.gsub(/[$,]/, '').to_i
end

def dollar_amount
  '\$[\d,.]+'
end
