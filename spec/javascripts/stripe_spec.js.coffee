# use require to load any .js file available to the asset pipeline

describe "Stripe", ->
  loadFixtures 'stripe'
  it "is Stripe", ->
    s = new Stripe
    expect(Stripe).toBeDefined()

