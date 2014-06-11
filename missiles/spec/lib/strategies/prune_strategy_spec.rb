describe PruneStrategy do
  let(:missile_data) { [15000, 15000, 20000, 20000, 19000] }
  let(:destruction_routes) { [ [1, 2], [3, 4, 5] ] }
  let(:optimal_destruction_route) { [3, 4, 5] }
  let(:prune_strategy) { PruneStrategy.new(missile_data) }

  it 'responds to #optimal_missile_destruction_route' do
    expect(prune_strategy).to respond_to :optimal_missile_destruction_route
  end
  it 'responds to #missile_destruction_routes' do
    expect(prune_strategy).to respond_to :missile_destruction_routes
  end

  context '#missile_destruction_routes' do
    it 'returns all the possible destruction routes' do
      expect(prune_strategy.missile_destruction_routes)
      .to eql destruction_routes
    end
  end

  context '#optimal_missile_destruction_route' do
    it 'returns the optimal missile destruction route' do
      expect(prune_strategy.optimal_missile_destruction_route)
      .to eql optimal_destruction_route
    end
  end
end
