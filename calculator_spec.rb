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

        it 'supports different delimiters, returns an integer, sum of the numbers' do
            result = calculator.add('//;\n1;2')
            expect(result).to eq(3)
        end

        it 'throws an exception “negatives not allowed” - and the negative that was passed.' do
            expect {calculator.add('//;\n1;2;3;-1;-2')}.to raise_error("negatives not allowed -1,-2")
        end

        it 'does add numbers bigger than 1000' do
            result = calculator.add('1,2,3,10001,1')
            expect(result).to eq(7)
        end

        it 'supports delimiters of any length, returns an integer, sum of the numbers' do
            result = calculator.add('//[***]\n1***2***3')
            expect(result).to eq(6)
        end
    end
end
