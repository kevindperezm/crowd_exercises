require_relative '../binary_tree/binary_tree'

# Strategy to locate optimal missile destruction route on a binary tree
# using prunes.
class PruneStrategy
  def initialize(missile_altitudes)
    @missile_altitudes = missile_altitudes
  end

  def optimal_missile_destruction_route
    routes = missile_destruction_routes
    routes.max_by { |route| route.size }
  end

  def missile_destruction_routes
    build_missile_tree unless @missile_tree
    routes = []
    @missile_tree.preorder do |tree_node|
      next if routes.any? { |r| r.include?(tree_node.position) }
      routes << tree_node.leftmost_branch.map { |node| node.position }
    end
    routes
  end

  private

  def build_missile_tree
    @missile_tree = BinaryTree.new(@missile_altitudes.first)
    last_node = @missile_tree.root
    @missile_altitudes.drop(1).each do |missile_altitude|
      # position = @missile_tree.node_count + 1
      # last_node = last_node.add_child(position, missile_altitude)
      @missile_tree.add_child(missile_altitude)
    end
  end
end
