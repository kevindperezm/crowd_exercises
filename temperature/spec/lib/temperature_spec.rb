require 'spec_helper'
require 'temperature'

describe Temperature do

  context 'from fahrenheit to celsius' do
    let(:subject) { Temperature.in_fahrenheit(10) }

    describe '.in_fahrenheit' do
      it 'creates a Temperature object' do
        expect(subject).to be_kind_of(Temperature)
      end
    end

    describe '#to_far' do
      it 'converts from fahrenheit to celsius' do
        expect(subject.to_cel).to be_within(0.5).of(-12.2222)
      end
    end
  end

  context 'from celsius to fahrenheit' do
    let(:subject) { Temperature.in_celsius(-12.2222) }

    describe '.in_celsius' do
      it 'creates a Temperature object' do
        expect(subject).to be_kind_of(Temperature)
      end
    end

    describe '#to_far' do
      it 'converts from celsius to farenheit' do
        expect(subject.to_far).to be_within(0.5).of(10)
      end
    end
  end
end
