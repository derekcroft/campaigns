# use require to load any .js file available to the asset pipeline
#= require application

describe "Charge", ->
  beforeEach ->
    loadFixtures 'stripe'

  it "is defined", ->
    expect(Charge).toBeDefined()

  it "has submit donation fields", ->
    expect($('#submit_donation')).toExist()
    expect($('#card_number')).toExist()
    expect($('#card_month')).toExist()
    expect($('#card_year')).toExist()
    expect($('#card_code')).toExist()
    expect($('#stripe_error')).toExist()

  it "creates a card from the fields", ->
    $('#submit_donation').click()
    alert $('#stripe_error').html()

