require_relative 'calculator'

RSpec.describe Calculator do 
    describe '#add' do 
        let(:calculator) { Calculator.new }  

        it 'accepts a string parameter' do
            expect { calculator.add('1,2,3') }.not_to raise_error 
        end
        
        it 'raises an error when called without a parameter' do
            expect { calculator.add() }.to raise_error(ArgumentError)
        end

        it 'returns an integer, sum of the numbers' do
            result = calculator.add('1000,100,10,1')
            expect(result).to eq(1111)
        end

        it 'accepts \n in string, returns an integer, sum of the numbers' do
            result = calculator.add('1000,100\n10\n1')
            expect(result).to eq(1111)
        end

        it 'Support different delimiters, returns an integer, sum of the numbers' do
            result = calculator.add('//;\n1;2')
            expect(result).to eq(3)
        end
    end
end
