class Customer
  attr_reader :name,:age
  attr_accessor :money,:drunk

  def initialize(name,money,age)
    @name = name
    @money = money
    @age = age
    @drunk = 0
  end

  def remove_funds(amount_to_remove)
    @money -= amount_to_remove
  end


end
