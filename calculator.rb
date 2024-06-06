require_relative 'utils'
class Calculator
    include Utils

    def add(str)
        sum = 0
        negative_num = []
        delimiter = set_delimiter(str)
        unless delimiter.empty?
            str = str[str.index(/\d/)..]
            str.gsub!(delimiter[0], ',')
            str.gsub!(delimiter[1], ',') unless delimiter[1].nil?
        end
        num_array = str.gsub('\n',',').split(',').each do |ch|
            num = ch.to_i
            negative_num << num if num < 0
            sum += num if num <= 1000
        end
        check_negatives(negative_num)
        sum
    end
end

calc1 = Calculator.new
puts "Enter a string of comma-separated numbers"
num_string = gets.chomp
puts calc1.add(num_string)
