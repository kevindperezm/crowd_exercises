describe MultipleTreeStrategy do
  let(:missile_data) { [5_000, 6_000, 5_500, 5_000, 4_500] }
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
  let(:strategy) { MultipleTreeStrategy.new(missile_data) }

  it 'responds to #optimal_missile_destruction_route' do
    expect(strategy).to respond_to :optimal_missile_destruction_route
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
      expect(strategy.optimal_missile_destruction_route)
      .to eql optimal_destruction_route
    end
  end
end
