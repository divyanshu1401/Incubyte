require_relative 'calculator'

RSpec.describe Calculator do 
    describe '#add' do 
        let(:calculator) { Calculator.new }  

        it 'accepts a string parameter' do
            expect { calculator.add("1,2,3") }.not_to raise_error 
        end
        
        it 'raises an error when called without a parameter' do
            expect { calculator.add() }.to raise_error(ArgumentError)
        end
    end
end
