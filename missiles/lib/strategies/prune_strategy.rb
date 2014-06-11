require_relative '../binary_tree/binary_tree_node'

class PruneStrategy
  def initialize(missile_altitudes)
    @missile_altitudes = missile_altitudes
  end

  def optimal_missile_destruction_route
    routes = missile_destruction_routes
    routes.max
  end

  def missile_destruction_routes
    build_missile_tree unless @missile_tree
    routes = []
    @missile_tree.preorder do |tree_node|
      next if routes.any? { |r| r.include?(tree_node.position) }
      routes << tree_node.leftmost_branch.collect { |node| node.position }
    end
    routes
  end

  private

  def build_missile_tree
    @missile_tree = BinaryTreeNode.new(1, @missile_altitudes.first)
    @missile_altitudes.drop(1).each do |missile_altitude|
      @missile_tree.add_child(missile_altitude)
    end
  end
end
