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

  def hash_value(value)
    return value[:vodka]
  end

  def stock_increase(stock, new_booze)
    stock[:vodka] += new_booze
  end

  def stock_decrease(stock, sold_booze)
    stock[:vodka] -= sold_booze
  end

  def all_booze_money(stock, vodka, whisky)
    voddy_value = vodka.price * stock[:vodka]
    whisky_value = whisky.price * stock[:strong_whisky]
    total_value = voddy_value + whisky_value
    return total_value

  end
  # def Hash.new { |hash, key| hash[key] =  }




  end
