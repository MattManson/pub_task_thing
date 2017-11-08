require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../customer.rb')
require_relative('../food.rb')

class TestFood < MiniTest::Test

  def setup
    @burger = Food.new("Burger", 5, 1)
  end

end
