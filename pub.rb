class Pub
  attr_reader :name, :drinks, :drunk_max, :age_limit
  attr_accessor :till

  def initialize(name,drinks)
    @name = name
    @drinks = drinks
    @till = 0
    @drunk_max = 100
    @age_limit = 18
  end

  def can_afford (wallet,price)
    if wallet <= price
      return false
    else
      return true
    end
  end
  #
  def drink_exists(drink_in)
    for drink in @drinks
      if drink.name == drink_in
        return true
      end
    end
    return false
  end

  def age_check(customer_age)
    if customer_age < @age_limit
      return false
    end
    return true
  end

  # def sell_drink(customer,bought_drink)
  #   # check drunk level, refuse if over
  #   if customer.drunk > @drunk_max
  #     return "No more drink for you"
  #   else
  #     cost = get_drink_price(drink)
  #     @till += cost
  #     customer.money -= cost
  #     return "Enjoy."
  # #   end
  # end

  def get_drink_price(bought_drink)
    cost = 0
    for drink in @drinks
      if drink.name == bought_drink
      cost = drink.price
      end
    end
    return cost
  end

  def check_drunkness?(customer)
    if customer.drunk >= @drunk_max
      return true
    else
      return false
    end
  end

  def sell_drink(customer, drink_to_sell)
    if check_drunkness?(customer) == false #this method would return true if drunk or false if not drunk we would sell drink

      customer.remove_funds(drink_to_sell.price)
      @till += drink_to_sell.price
    end

  end


end
