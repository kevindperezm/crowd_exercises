describe PruneStrategy do
  let(:missile_data) { [5_000, 6_000, 5_500, 5_000, 4_500] }
  let(:destruction_routes) { [[1], [2, 3, 4, 5]] }
  let(:optimal_destruction_route) { [2, 3, 4, 5] }
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

  context 'when evaluating test cases' do
    let(:test_cases_data) do
      [[5_000, 6_000, 5_500, 5_000, 4_500],
       [4_500, 3_600, 7_200, 6_789, 4_321],
       [15_000, 15_000, 20_000, 20_000]]
    end
    let(:test_cases_solutions) do
      [[2, 3, 4, 5],
       [3, 4, 5],
       [1, 2]]
    end

    it 'evaluates correctly test case #1' do
      prune_strategy = PruneStrategy.new(test_cases_data[0])
      expect(prune_strategy.optimal_missile_destruction_route)
      .to eql test_cases_solutions[0]
    end
    it 'evaluates correctly test case #2' do
      prune_strategy = PruneStrategy.new(test_cases_data[1])
      expect(prune_strategy.optimal_missile_destruction_route)
      .to eql test_cases_solutions[1]
    end
    it 'evaluates correctly test case #3' do
      prune_strategy = PruneStrategy.new(test_cases_data[2])
      expect(prune_strategy.optimal_missile_destruction_route)
      .to eql test_cases_solutions[2]
    end
  end
end
