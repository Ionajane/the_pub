require("minitest/autorun")
require("minitest/rg")
require_relative("../customer.rb")
require_relative("../drink.rb")

class CustomerTest < MiniTest::Test

  def setup()
    # [drink, price, alcohol_level]
    @drink1 = Drink.new("Gin and Tonic",3,4)
    @drink2 = Drink.new("Irn Bru on the rocks", 4, 0)
    @drink3 = Drink.new("Pint of Whisky",600,100)

    # [name,  money,  age]
    @customer1 = Customer.new("Peter Whiffle",50,67)
    @customer2 = Customer.new("Janet Staples",25,23)
    @customer3 = Customer.new("Jason Cup",695,17)

  end

  def test_name()
    assert_equal("Janet Staples",@customer2.name)
  end

  def test_money()
    assert_equal(50,@customer1.money)
  end

  def test_age()
    assert_equal(17,@customer3.age)
  end
end
