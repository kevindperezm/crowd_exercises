require './lib/missile'
require './lib/missile_destroyer'
require './lib/destruction_strategies/multiple_tree'

describe MissileDestroyer do
  let(:missiles) do
    [
      Missile.new(1, 5_000),
      Missile.new(2, 6_000),
      Missile.new(3, 5_500),
      Missile.new(4, 5_000),
      Missile.new(5, 4_500)
    ]
  end
  let(:other_missiles) do
    [
      Missile.new(1, 3_000),
      Missile.new(2, 9_000),
      Missile.new(3, 1_500),
      Missile.new(4, 6_000),
      Missile.new(5, 3_500)
    ]
  end
  let(:best_destruction_route) { [2, 3, 4, 5] }
  let(:other_best_destruction_route) { [2, 4, 5] }
  subject(:destroyer) { MissileDestroyer.new(missiles) }

  let(:strategy) { DestructionStrategies::MultipleTree.new(missiles) }
  let(:strategy_destroyer) do
    MissileDestroyer.new(missiles, strategy: strategy)
  end

  it 'has a default destruction strategy' do
    expect { MissileDestroyer.new(missiles) }.to_not raise_error { Exception }
  end

  it 'accepts a given destruction strategy' do
    expect(strategy_destroyer.strategy).to equal strategy
  end

  it 'updates its strategy if its missiles change' do
    destroyer.missiles = other_missiles
    expect(destroyer.best_destruction_route).to eql other_best_destruction_route
  end

  describe '#best_destruction_route' do
    it 'returns the best destruction route for the given missiles' do
      expect(subject.best_destruction_route).to eql best_destruction_route
    end
  end
end
