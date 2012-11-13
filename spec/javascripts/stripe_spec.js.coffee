# use require to load any .js file available to the asset pipeline
#= require application

describe "Stripe", ->
  loadFixtures 'stripe'
  it "is Stripe", ->
    expect(false).toEqual(false)

