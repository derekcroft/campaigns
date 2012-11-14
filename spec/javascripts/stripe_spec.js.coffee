#= require 'https://js.stripe.com/v1/'
#= require stripe
#
describe 'Stripe', ->
  it 'is stripey', ->
    pledge = new Pledge
    expect(pledge).toBeDefined()
