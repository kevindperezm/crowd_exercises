
require_relative '../lib/random_generators/generators'

describe Generators::Multiplicative do

  FIRST_RANDOMS = [27, 81, 43]
  CHECK_RANDOM_TIMES = 1_000 # Enough?

  before :each do
    @gen = Generators::Multiplicative.new
  end
  
  describe "#new" do
    it "takes no parameters and returns a valid Multiplicative instance" do
      expect( [@gen.next, @gen.next, @gen.next] ).to eql FIRST_RANDOMS
    end
  end

  describe "#next" do
    it "always returns a different pseudo-random number" do
      last_number = 0
      CHECK_RANDOM_TIMES.times do
        new_number = @gen.next
        expect(last_number).to_not eql new_number
        last_number = new_number
      end
    end
  end

  describe '#next' do
    it 'always returns a Fixnum value' do
      CHECK_RANDOM_TIMES.times do
        expect(@gen.next).to be_an_instance_of Fixnum 
      end
    end
  end

end
