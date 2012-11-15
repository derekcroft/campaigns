# use require to load any .js file available to the asset pipeline
#= require application

describe "Card", ->
  it "is defined", ->
    expect(Card).toBeDefined()

  describe "constructor()", ->
    card = new Card "4242424242424242", "3", "2015", "991"

    it "has a number", ->
      expect(card.number).toEqual("4242424242424242")

    it "has an expiration month", ->
      expect(card.expirationMonth).toEqual(3)

    it "has an expiration year", ->
      expect(card.expirationYear).toEqual(2015)

    it "has a cvc", ->
      expect(card.cvc).toEqual("991")

  describe "monthName()", ->
    it "is undefined if month is undefined", ->
      expect(Card.monthName(undefined)).toBeUndefined()

    it "is the correct month", ->
      expect(Card.monthName(0)).toEqual("January")
      expect(Card.monthName(1)).toEqual("February")
      expect(Card.monthName(2)).toEqual("March")
      expect(Card.monthName(3)).toEqual("April")
      expect(Card.monthName(4)).toEqual("May")
      expect(Card.monthName(5)).toEqual("June")
      expect(Card.monthName(6)).toEqual("July")
      expect(Card.monthName(7)).toEqual("August")
      expect(Card.monthName(8)).toEqual("September")
      expect(Card.monthName(9)).toEqual("October")
      expect(Card.monthName(10)).toEqual("November")
      expect(Card.monthName(11)).toEqual("December")

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
      expect(@card.expirationValid()).toBe(true)

  describe "isAmericanExpress()", ->
    card = new Card "1234123412341234", "3", "2012", "819"

    it "is false if card number is not defined", ->
      card.number = undefined
      expect(card.isAmericanExpress()).toBe(false)

    it "is true if card number starts with 34", ->
      card.number = "3434343434343434"
      expect(card.isAmericanExpress()).toBe(true)

    it "is true if card number starts with 37", ->
      card.number = "3734343434343434"
      expect(card.isAmericanExpress()).toBe(true)

    it "is false if card number starts with anything else", ->
      card.number = "4242424242424242"
      expect(card.isAmericanExpress()).toBe(false)
      card.number = "5500550055005500"
      expect(card.isAmericanExpress()).toBe(false)

  describe "cvcValid()", ->
    card = new Card

    it "is invalid if cvc is undefined", ->
      card.cvc = undefined
      expect(card.cvcValid()).toBe(false)

    describe "if card is amex", ->
      beforeEach ->
        spyOn(card, 'isAmericanExpress').andReturn(true)

      it 'is invalid if cvc is one digit long', ->
        card.cvc = '1'
        expect(card.cvcValid()).toBe(false)

      it 'is invalid if cvc is two digits long', ->
        card.cvc = '12'
        expect(card.cvcValid()).toBe(false)

      it 'is invalid if cvc is three digits long', ->
        card.cvc = '123'
        expect(card.cvcValid()).toBe(false)

      it 'is valid if cvc is four digits long', ->
        card.cvc = '1234'
        expect(card.cvcValid()).toBe(true)

      it 'is invalid if cvc is five digits long', ->
        card.cvc = '12345'
        expect(card.cvcValid()).toBe(false)

    describe "if card is not amex", ->
      beforeEach ->
        spyOn(card, 'isAmericanExpress').andReturn(false)

      it 'is invalid if cvc is one digit long', ->
        card.cvc = '1'
        expect(card.cvcValid()).toBe(false)

      it 'is invalid if cvc is two digits long', ->
        card.cvc = '12'
        expect(card.cvcValid()).toBe(false)

      it 'is valid if cvc is three digits long', ->
        card.cvc = '123'
        expect(card.cvcValid()).toBe(true)

      it 'is invalid if cvc is four digits long', ->
        card.cvc = '1234'
        expect(card.cvcValid()).toBe(false)

      it 'is invalid if cvc is five digits long', ->
        card.cvc = '12345'
        expect(card.cvcValid()).toBe(false)

