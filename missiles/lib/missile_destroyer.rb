require_relative 'destruction_strategies/multiple_tree'

class MissileDestroyer
  attr_accessor :missiles, :strategy

  def initialize(missiles, options = {})
    @missiles = missiles
    @strategy = options[:strategy]
  end

  def best_destruction_route
    @strategy ||= DestructionStrategies::MultipleTree.new(@missiles)
    @strategy.best_destruction_route
  end

  def missiles=(missiles)
    @missiles = missiles
    @strategy = @strategy.class.new(missiles)
  end
end
