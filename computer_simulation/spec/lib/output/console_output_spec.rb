require "spec_helper"

describe ConsoleOutput do
	
  describe '#generate' do
    it 'raises an error if you pass "nil" as the parameter' do
      expect { subject.generate nil }.to raise_error { Exception }
    end
    it 'returns a string if no errors ocurred' do
      turn = {amount_before_bet: 100, 
              bet: 20, 
              pseudo_random: 10, 
              won: true, 
              amount_after_bet: 120,
              broke: false}
      turns = [turn] # #generate expects an array with hashes like turn, one per each turn
      expect(subject.generate turns).to be_an_instance_of String
    end
  end

end