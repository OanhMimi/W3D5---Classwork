require_relative "00_tree_node.rb"

class KnightPathFinder

    def self.valid_moves(pos)
        all_moves = [
        [2,1]  ,
        [1,2] ,
        [-1,-2]  ,
        [-1,2]  ,
        [-2,1]  ,
        [-2,-1]  ,
        [1,-2]  ,
        [2,-1]  
        ]
        
        valid_m = []
        all_moves.each do |subArray|
            if subArray[0] + pos[0] >= 0 &&  subArray[1] + pos[1] >= 0
                valid_m << [(subArray[0]+ pos[0]),(subArray[1] + pos[1])]
            end
        end
        valid_m
    end

    def initialize(pos)
        @root_mode = PolyTreeNode.new(pos)
        self.build_move_tree
        @considered_positions = [pos]
    end

    def build_move_tree
        arr = self.new_move_position(self.root_mode.value)

        cur_node = self
        until arr.empty?         
             cur_node = arr.shift
             cur_node.children.each do |ele|
        #         arr << ele
                
        #     end
        #     if cur_node.value == target
        #         return cur_node
        #     end
        # end
        # nil  
    end

    def new_move_position(pos)
        moves = KnightPathFinder.valid_moves(pos)
        new_moves = []
        moves.each do |subArray|
            unless @considered_positions.include?(subArray)
                new_moves << subArray
            end
        end
        new_moves
    end


    private

    attr_reader :root_mode


end

kpf = KnightPathFinder.new([0, 0])
