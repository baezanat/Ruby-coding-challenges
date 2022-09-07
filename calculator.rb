require "pry"
require "pry-byebug"

def prompt(message)
  puts ""
  puts("=> #{message}")
end

def valid_number?(num)
  num.to_i != 0
end

def valid_operation?(operation)
  %w(1 2 3 4).include?(operation)
end

def operation_to_message(operation)
  case operation
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to Calculator! Enter your name:")
name = nil

loop do
  name = gets.chomp
  if name.empty?
    prompt "Make sure to use a valid name."
  else
    break
  end
end

prompt "Hi #{name}"

loop do
  number1 = nil
  number2 = nil
  operation = nil

  loop do
    prompt("What's the first number?")
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  loop do
    prompt("What's the second number?")
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  operator_prompt = <<-MSG
  What operation would you like to perform?

  1) add
  2) subtract
  3) multiply
  4) divide

  MSG

  prompt(operator_prompt)

  loop do
    operation = gets.chomp

    if valid_operation?(operation)
      break
    else
      prompt("Hmm... that does not look like a valid operation. Try again. 1) add, 2) subtract, 3) multiply, 4) divide")
    end
  end

  prompt("#{operation_to_message(operation)} the numbers...")

  result = case operation
           when '1'
             binding.pry
             number1.to_i + number2.to_i
            when '2'
             number1.to_i - number2.to_i
            when '3'
             number1.to_i * number2.to_i
            when '4'
             number1.to_f / number2.to_f
            else
              "Invalid"
           end

  prompt "The result of the operation is #{result}"
  puts ""
  prompt "Do you want to perform another calculation? (Y/N)"
  calculate_again = gets.chomp
  break unless calculate_again.downcase.start_with?('y')
end

prompt "Thank you for using the calculator. Goodbye!"
