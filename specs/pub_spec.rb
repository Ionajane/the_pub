require("minitest/autorun")
require("minitest/rg")
require_relative("../customer.rb")
require_relative("../drink.rb")
require_relative("../pub.rb")

class PubTest < MiniTest::Test

  def setup()
    # [drink, price, alcohol_level]
    @drink1 = Drink.new("Gin and Tonic",3,4)
    @drink2 = Drink.new("Irn Bru on the rocks", 4, 0)
    @drink3 = Drink.new("Pint of Whisky",600,100)

    # [name,  money,  age]
    @customer1 = Customer.new("Peter Whiffle",50,67)
    @customer2 = Customer.new("Janet Staples",25,23)
    @customer3 = Customer.new("Jason Cup",695,19)
    @customer4 = Customer.new("Crusty Juggler",1,9)

    @pub = Pub.new("The Jammy Dodger",[@drink1,@drink2,@drink3])
  end

  def test_pub_name()
    assert_equal("The Jammy Dodger", @pub.name())
  end

  def test_g_and_t_price()
    assert_equal(3,@drink1.price())
  end

  def test_till_is_zero
    assert_equal(0,@pub.till)
  end

  def test_max_drunk_max
    assert_equal(100,@pub.drunk_max)
  end

  def test_min_age
    assert_equal(18,@pub.age_limit)
  end

  def test_does_drink_exist__false()
    assert_equal(false,@pub.drink_exists("Bucket of bleach"))
  end
  #
  def test_does_drink_exist__true()
    assert_equal(true,@pub.drink_exists("Gin and Tonic"))
  end

  def test_can_customer_afford_drink__true
    assert_equal(true,@pub.can_afford(@customer1.money, @drink1.price))
  end

  def test_can_customer_afford_drink__false
      assert_equal(false,@pub.can_afford(@customer4.money, @drink1.price))
  end

  def test_customer_age__true
    assert_equal(true,@pub.age_check(@customer2.age))
  end

  def test_customer_age__false
    assert_equal(false,@pub.age_check(@customer4.age))
  end

  def test_wallet_change
    @pub.sell_drink(@customer3,"Pint of Whisky")
    assert_equal(95, @customer3.money)
  end

  def test_till_total
    @pub.sell_drink(@customer3,"Pint of Whisky")
    assert_equal(600,@pub.till)
  end

  def test_check_drunkness?()
    assert_equal("Enjoy.", @pub.sell_drink(@customer3, @drink3))
    assert_equal(600, @pub.till)
    assert_equal(95, @customer3.money)
  end

  # def test_customer_drunkedness__true
  #   assert_equal("No more drink for you",@pub.sell_drink)
  # end
  #
  # def test_check_drunkness?()
  #   assert_equal
  # end

end
