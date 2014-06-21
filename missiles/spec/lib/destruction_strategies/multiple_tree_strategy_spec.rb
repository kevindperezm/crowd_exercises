describe DestructionStrategies::MultipleTree do
  let(:missiles) do
    [
      Missile.new(1, 5_000),
      Missile.new(2, 6_000),
      Missile.new(3, 5_500),
      Missile.new(4, 5_000),
      Missile.new(5, 4_500)
    ]
  end
  let(:all_missile_destruction_routes) do
    [
      [1, 4, 5],
      [2, 3],
      [2, 3, 4, 5],
      [3, 4, 5],
      [4, 5],
      [5]
    ]
  end
  let(:optimal_destruction_route) { [2, 3, 4, 5] }
  let(:strategy) { DestructionStrategies::MultipleTree.new(missiles) }

  it 'responds to #best_destruction_route' do
    expect(strategy).to respond_to :best_destruction_route
  end
  it 'responds to #missile_destruction_routes' do
    expect(strategy).to respond_to :missile_destruction_routes
  end

  context '#missile_destruction_routes' do
    it 'returns all the possible missile destruction routes' do
      expect(strategy.missile_destruction_routes)
      .to eql all_missile_destruction_routes
    end
  end

  context '#optimal_missile_destruction_route' do
    it 'returns the optimal missile destruction route' do
      expect(strategy.best_destruction_route)
      .to eql optimal_destruction_route
    end
  end
end
