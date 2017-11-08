require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../customer.rb')
require_relative('../food.rb')

class TestCustomer < MiniTest::Test

  def setup
    @jimmy = Customer.new("Jimmy", 15, 30)
    @sam = Customer.new("Sam", 15, 17)
    @rab = Customer.new("Rab", 100, 45)
    @vodka = Drink.new("Vodka", 10, 1)
    @strong_whisky = Drink.new("Strong Whisky", 10, 3)
    @burger = Food.new("Burger", 5, 1)
  end

  def test_buy_drink
    @jimmy.buy_drink(@vodka)
    assert_equal(@jimmy.wallet, 5)
    assert_equal(@jimmy.drinkno.length, 1)
  end

  def test_increase_drunkenness
    value = @jimmy.increase_drunkenness(@vodka)
    assert_equal(value, 1)
  end

  def test_eat_food
    @rab.buy_drink(@strong_whisky)
    @rab.increase_drunkenness(@strong_whisky)
    @rab.eat_food(@burger)
    assert_equal(@rab.drunkenness, 2)
  end


end
