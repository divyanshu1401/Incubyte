class Calculator
    def add(str)
        sum = 0
        negative_num = []
        delimiter = ''
        if str.start_with?(/\/\/.\\n/) 
            delimiter = str[2]
        end
        unless delimiter.empty?
            str = str[5..]
            str.gsub!(delimiter, ',')
        end
        num_array = str.gsub('\n',',').split(',').each do |ch|
            num = ch.to_i
            negative_num << num if num < 0
            sum += num
        end
        raise "negatives not allowed #{negative_num.join(',')}" unless negative_num.empty?
        sum
    end
end

calc1 = Calculator.new
puts "Enter a string of comma-separated numbers"
num_string = gets.chomp
puts calc1.add(num_string)
