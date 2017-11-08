require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../customer.rb')

class TestPub < MiniTest::Test

  def setup
    @the_pub = Pub.new("The Pub", 100)
    @vodka = Drink.new("Vodka", 10)
    @jimmy = Customer.new("Jimmy", 15, 30)
  end

  def test_number_of_drinks
    assert_equal(@the_pub.drinks.length, 0)
  end

  def test_add_drink_to_list
    @the_pub.add_drink_to_list(@vodka)
    assert_equal(@the_pub.drinks.length, 1)
  end

  def test_sell_drink
    @the_pub.add_drink_to_list(@vodka)
    @the_pub.sell_drink(@vodka)
    assert_equal(@the_pub.drinks.length, 0)
    assert_equal(@the_pub.till, 110)
  end

  def test_sale
    @the_pub.add_drink_to_list(@vodka)
    @the_pub.sell_drink(@vodka)
    @jimmy.buy_drink(@vodka)
    assert_equal(@the_pub.drinks.length, 0)
    assert_equal(@the_pub.till, 110)
    assert_equal(@jimmy.wallet, 5)
  end



end
