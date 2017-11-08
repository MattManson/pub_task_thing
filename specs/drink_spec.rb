require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../customer.rb')

class TestDrink < MiniTest::Test

  def setup
    @vodka = Drink.new("Vodka", 10)
  end

end
