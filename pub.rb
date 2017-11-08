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

  def sell_drink(drink)
    @drinks.pop
    @till += drink.price
  end





end
