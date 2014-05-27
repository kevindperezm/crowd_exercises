require "spec_helper"

describe Generators::Multiplicative do

  context '#next' do
    it 'returns an integer value' do 
      expect(subject.next).to be_an_integer
    end

    context 'with default options' do
      let(:first_values) { [subject.next, subject.next, subject.next] }

      it 'returns [27, 81, 43] as its first three pseudo-random numbers' do
        expect(first_values).to eql [27, 81, 43]
      end

      it "returns at least 100 numbers without repeating a single one" do
        50.times { expect(subject.next).to_not eql subject.next }
      end
    end

  end

end
