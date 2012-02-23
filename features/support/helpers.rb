def currency_to_i(amount)
  amount.gsub(/[$,]/, '').to_i
end
