class Pub

  attr_accessor :name, :till, :drinks

  def initialize(name, till)
    @name = name
    @till = till
    @drinks = []
  end

  def number_of_drinks
    @drinks.length
  end

  def add_drink_to_list(drink)
    @drinks << drink
  end

  def sell_drink(drink, customer)
    if customer.age <= 18
      return
    elsif customer.drunkenness >= 3
      return "refuse sale"
    else
      value = @drinks.pop
      customer.drinkno << value
      @till += drink.price
    end
  end

  def drunkenness_of_customer(drink, customer)
    value = customer.drunkenness
    return value
  end




  end
