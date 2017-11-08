require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../customer.rb')
require_relative('../food.rb')

class TestDrink < MiniTest::Test

  def setup
    @vodka = Drink.new("Vodka", 10, 1)
    @strong_whisky = Drink.new("Strong Whisky", 10, 3)
  end

end
