# Correct the following program so it will work properly. Assume that the Customer and Employee classes have complete implementations; just make the smallest possible change to ensure that objects of both types have access to the print_address method.

module Mailable
  def print_address
    puts "#{name}"
    puts "#{address}"
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Mail
  include Mailable
  attr_reader :name, :address, :city, :state, :zipcode

  def initialize(name, address, city, state, zipcode)
    @name = name
    @address = address
    @city = city
    @state = state
    @zipcode = zipcode
  end
end

class Customer < Mail
end

class Employee < Mail
end

betty = Customer.new('Betty', 'Apple St', 'St Louis', 'KY', 50362)
bob = Employee.new('Bob', 'Mago St', 'New Orleans', 'LA', 30351)
betty.print_address
bob.print_address
