class Card
  constructor: (@number, @expirationMonth, @expirationYear, @cvc) ->
    @expirationMonth = parseInt(@expirationMonth) if typeof(@expirationMonth) == 'string'
    @expirationYear = parseInt(@expirationYear) if typeof(@expirationYear) == 'string'

  @validExpirationMonthAndYear: ->
    today = new Date
    "#{@monthName(today.getMonth())} #{today.getFullYear()}"

  @monthName: (monthNumber) ->
    monthNames = [
      "January", "February", "March", "April",
      "May", "June", "July", "August",
      "September", "October", "November", "December"
    ]
    monthNames[monthNumber]

  expirationValid: ->
    today = new Date
    expirationDate = new Date(@expirationYear, @expirationMonth)
    expirationDate > today

  isAmericanExpress: ->
    @number?.substring(0,2) in ["34", "37"]

  cvcValid: ->
    @cvc?.length == if @isAmericanExpress() then 4 else 3

window.Card = Card


