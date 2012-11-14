# use require to load any .js file available to the asset pipeline
#= require application

describe "Card", ->
  it "is defined", ->
    expect(Card).toBeDefined()

  describe "#constructor", ->
    card = new Card "4242424242424242", "3", "2015", "991"

    it "has a number", ->
      expect(card.number).toEqual("4242424242424242")

    it "has an expiration month", ->
      expect(card.expirationMonth).toEqual("3")

    it "has an expiration year", ->
      expect(card.expirationYear).toEqual("2015")

    it "has a cvc", ->
      expect(card.cvc).toEqual("991")

  describe "monthName()", ->
    it "is undefined if month is undefined", ->
      expect(Card.monthName(undefined)).toBeUndefined()

    it "is the correct month", ->
      expect(Card.monthName(1)).toEqual("January")
      expect(Card.monthName(2)).toEqual("February")
      expect(Card.monthName(3)).toEqual("March")
      expect(Card.monthName(4)).toEqual("April")
      expect(Card.monthName(5)).toEqual("May")
      expect(Card.monthName(6)).toEqual("June")
      expect(Card.monthName(7)).toEqual("July")
      expect(Card.monthName(8)).toEqual("August")
      expect(Card.monthName(9)).toEqual("September")
      expect(Card.monthName(10)).toEqual("October")
      expect(Card.monthName(11)).toEqual("November")
      expect(Card.monthName(12)).toEqual("December")

  describe "expirationValid()", ->
    beforeEach ->
      @card = new Card "4242424242424242", "3", "2015", "991"

    it "is invalid if expiration month is undefined", ->
      @card.expirationMonth = undefined
      expect(@card.expirationValid()).toBe(false)

    it "is invalid if expiration year is undefined", ->
      @card.expirationYear = undefined
      expect(@card.expirationValid()).toBe(false)

    it "is invalid if expiration date is before this month", ->
      weekAgo = new Date
      weekAgo.setMonth(weekAgo.getMonth() - 7)
      @card.expirationMonth = weekAgo.getMonth()
      @card.expirationYear = weekAgo.getFullYear()
      expect(@card.expirationValid()).toBe(false)

    it "is invalid if expiration date is this month", ->
      today = new Date
      @card.expirationMonth = today.getMonth()
      @card.expirationYear = today.getFullYear()
      expect(@card.expirationValid()).toBe(false)

    it "is valid if expiration date is next month", ->
      nextMonth = new Date
      nextMonth.setMonth(nextMonth.getMonth() + 1)
      alert nextMonth
      expect(@card.expirationValid()).toBe(true)

