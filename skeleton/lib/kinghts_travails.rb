require_relative "00_tree_node.rb"

class KnightPathFinder

    def self.valid_moves(pos)

    end

    def initialize(pos)
        @root_mode = PolyTreeNode.new(pos)
        self.build_move_tree
        @considered_positions = [pos]
    end

    def build_move_tree

    end

    def new_move_position(pos)

    end

    def valid_moves(pos)
        
    end

end

kpf = KnightPathFinder.new([0, 0])
