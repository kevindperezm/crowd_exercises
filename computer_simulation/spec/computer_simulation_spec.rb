
require '../computer_simulation'

describe Generators::Multiplicative do
	
	describe "#new" do
		it "takes no parameters and return a valid Multiplicative instance" do
			generator = Generators::Multiplicative.new
			generator.next.should eql 27
			generator.next.should eql 81
			generator.next.should eql 43
		end
	end

	describe "#next" do
		it "returns a new pseudo-random number every call, always different from last one" do
			generator = Generators::Multiplicative.new
			last_number = 0
			1_000.times do
				new_number = generator.next
				last_number.should_not eql new_number
				last_number = new_number
			end
		end
	end

end
