class Customer

  attr_accessor :name, :wallet, :age, :drinkno, :drunkenness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drinkno = []
    @drunkenness = 0
  end

  def buy_drink(drink)
    @wallet -= drink.price
    @drinkno << drink
  end

  def increase_drunkenness(drink)
    @drunkenness += drink.alcohol_level
  end

  def eat_food(food)
    @drunkenness -= food.rejuv_level
    return @drunkenness
  end

end
