class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def wheels(num)
    num
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
end

class Motorcycle < Vehicle
end

class Truck < Vehicle
  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end
end

my_car = Car.new('BMW', 2001)
puts my_car.to_s
