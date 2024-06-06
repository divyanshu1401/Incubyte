class Calculator
    def add(str)
        sum = 0
        num_array = str.split(',').each do |ch|
            num = ch.to_i
            sum += num
        end
        sum
    end
end

calc1 = Calculator.new
puts "Enter a string of comma-separated numbers"
num_string = gets.chomp
result = calc1.add(num_string)
puts result