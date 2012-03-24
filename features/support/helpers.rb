def currency_to_i(amount)
  amount.gsub(/[$,]/, '').to_i
end

def dollar_amount
  '\$[\d,.]+'
end

Around('@firefox') do |scenario, block|
  js_driver = Capybara.javascript_driver
  Capybara.javascript_driver = :selenium
  block.call
  Capybara.javascript_driver = js_driver
end
