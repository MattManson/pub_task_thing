require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../customer.rb')
require_relative('../food.rb')

class TestPub < MiniTest::Test

  def setup
    @the_pub = Pub.new("The Pub", 100)
    @vodka = Drink.new("Vodka", 10, 1)
    @strong_whisky = Drink.new("Strong Whisky", 50, 3)
    @jimmy = Customer.new("Jimmy", 15, 30)
    @sam = Customer.new("Sam", 15, 17)
    @rab = Customer.new("Rab", 100, 45)
    @burger = Food.new("Burger", 5, 1)

    @stock = {
      :vodka => 5,
      :strong_whisky => 6,
    }
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
    @the_pub.sell_drink(@vodka, @jimmy)
    assert_equal(@the_pub.drinks.length, 0)
    assert_equal(@the_pub.till, 110)
  end

  def test_sale
    @the_pub.add_drink_to_list(@vodka)
    @the_pub.sell_drink(@vodka, @jimmy)
    @jimmy.buy_drink(@vodka)
    assert_equal(@the_pub.drinks.length, 0)
    assert_equal(@the_pub.till, 110)
    assert_equal(@jimmy.wallet, 5)
  end

  def test_refuse_sale
    @the_pub.add_drink_to_list(@vodka)
    @the_pub.sell_drink(@vodka, @sam)
    @sam.buy_drink(@vodka)
    assert_equal(@the_pub.drinks.length, 1)
    assert_equal(@the_pub.till, 100)
    assert_equal(@jimmy.wallet, 15)
  end

  def test_drunkenness_of_customer
    @the_pub.add_drink_to_list(@vodka)
    @the_pub.sell_drink(@vodka, @jimmy)
    @jimmy.buy_drink(@vodka)
    @jimmy.increase_drunkenness(@vodka)
    value = @the_pub.drunkenness_of_customer(@vodka, @jimmy)
    assert_equal(value, 1)
  end

  def test_rabs_too_drunk
    @the_pub.add_drink_to_list(@strong_whisky)
    @the_pub.add_drink_to_list(@vodka)
    @rab.buy_drink(@strong_whisky)
    @rab.increase_drunkenness(@strong_whisky)
    @rab.buy_drink(@vodka)
    value = @the_pub.sell_drink(@strong_whisky, @rab)
    assert_equal(value, "refuse sale")
  end

  def test_number_of_drinks_multiple_drinks
    @the_pub.add_drink_to_list(@strong_whisky)
    @the_pub.add_drink_to_list(@vodka)
    assert_equal(@the_pub.drinks.length, 2)
  end

  def test_hash_value
    donkey = @the_pub.hash_value(@stock)
    assert_equal(donkey, 5)
  end

  def test_add_to_stock
    value = @the_pub.stock_increase(@stock, 10)
    assert_equal(value, 15)
  end

  def test_remove_from_stock_hash
    value = @the_pub.stock_decrease(@stock, 3)
    assert_equal(value, 2)
  end

  def test_total_value_drinks
    value = @the_pub.all_booze_money(@stock, @vodka, @strong_whisky)
    assert_equal(350, value)
  end

  # def test_remove_from_stock
  #   remove_from_stock(@the_pub, :vodka)
  #   result =
  # end



end
