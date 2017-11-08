class Customer

attr_accessor :name, :wallet, :age, :drinkno

def initialize(name, wallet, age)
  @name = name
  @wallet = wallet
  @age = age
  @drinkno = []
end

def buy_drink(drink)
  @wallet -= drink.price
  @drinkno << drink
end


end
