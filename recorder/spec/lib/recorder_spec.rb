require 'spec_helper'

describe Recorder do
  let(:recorder) { recorder = Recorder.new }

  it 'responds to #playback' do
    expect(recorder).to respond_to :playback
  end

  context 'when calling methods that Recorder doesn\'t define' do
    it 'doesn\'t raises an error' do
      expect { recorder.non_defined_method }
      .to_not raise_error { NoMethodError }
    end

    it 'records the method call' do
      expect { recorder.my_method }.to change { recorder.recorded_methods }
      .from({}).to(my_method: [])
    end

    it 'allows chaining method calls' do
      expect(recorder.call_method).to be recorder
    end
  end

  context '#playback' do
    let(:recorder) do
      Recorder.new.reverse!.downcase!.insert(2, 'ABBA').delete!('A')
    end
    let(:test_object) { 'Hello World' }
    let(:test_array) { %w(Hello World) }

    it 'plays all recorded methods against a passed object' do
      recorder.playback(test_object)
      expect(test_object).to eq 'dlBBrow olleh'
    end

    it 'skip methods that the passed object doesn\'t respond to' do
      recorder.pop
      recorder.playback(test_array)
      expect(test_array).to eql %w(World Hello)
    end

    it 'returns the object passed in after methods are called on it' do
      expect(recorder.playback(test_array)).to be test_array
    end
  end
end
