require_relative 'destruction_strategies/multiple_tree'
require_relative 'input/file'
require_relative 'output/file'

class MissileDestroyer
  attr_accessor :missiles, :strategy

  def initialize(missiles = [], options = {})
    @missiles = missiles
    @strategy = options[:strategy]
  end

  def best_destruction_route
    @strategy ||= DestructionStrategies::MultipleTree.new(@missiles)
    @strategy.best_destruction_route
  end

  def load_missiles_from_file(path)
    missiles = Input::File.new(path).missiles
  end

  def write_route_to_file(route, path)
    Output::File.new(path).write(route)
  end

  def missiles=(missiles)
    @missiles = missiles
    @strategy && @strategy = @strategy.class.new(missiles)
  end
end
