module Utils
    def check_negatives(num)
        raise "negatives not allowed #{num.join(',')}" unless num.empty?
    end 

    def set_delimiter(str)
        delimiter = []
        if str.start_with?(/\/\/.\\n/) 
            delimiter << str[2]
        elsif str.start_with?(/\/\/\[.{3}\]\\n/)
            delimiter << str[3..5]
        elsif str.start_with?(/\/\/\[.\]\[.\]\\n/)
            delimiter << str[3]
            delimiter << str[6]
        elsif str.start_with?(/\/\/\[.+\]\[.+\]\\n/)
            delimiter << str[3..str.index(']')-1]
            delimiter << str[str.rindex('[')+1..str.rindex(']')-1]
        end
        delimiter
    end
end