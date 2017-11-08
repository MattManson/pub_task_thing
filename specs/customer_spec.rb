require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../customer.rb')

class TestCustomer < MiniTest::Test

  def setup
    @jimmy = Customer.new("Jimmy", 15, 30)
    @vodka = Drink.new("Vodka", 10)
  end

  def test_buy_drink
    @jimmy.buy_drink(@vodka)
    assert_equal(@jimmy.wallet, 5)
  end

end
