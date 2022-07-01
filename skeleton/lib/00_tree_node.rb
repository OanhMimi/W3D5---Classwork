require "byebug"

class PolyTreeNode

    attr_reader :parent, :children, :value
    def initialize(value)
        @value = value
        @parent = nil
        @children = []

    end

    def parent=(par) #p is an instance of another poly tree
        unless par.nil?
            if self.parent != nil
                @parent.children.each do |ele|
                    if ele == self
                        @parent.children.delete(self)
                    end
                end
            end

        
        @parent = par 
        par.children << self
        self
        else 
            @parent = nil
        end
        
    end

    def add_child(child)
        child.parent = self
    end
    
    def remove_child(child)
        if child.is_a?(PolyTreeNode) && self.children.include?(child)
            child.parent = nil
        else 
            raise "not a child!!!!!!!!!!!"
        end
    end

    def dfs(target)

        # return self if self.value == target
        # self.children.inject(nil) do |acc,ele|
        #     ele.dfs(target)
        # end
        arr = nil
        return self if self.value == target
        return nil if self.children.empty?
        self.children.each do |ele|
            arr = ele.dfs(target)
            return arr unless arr.nil?
        end
        nil
    end

    def bfs(target)
        arr=[self]
        cur_node = self
        until arr.empty?         
            cur_node = arr.shift
            cur_node.children.each do |ele|
                arr << ele
                
            end
            if cur_node.value == target
                return cur_node
            end
        end
        nil        
    end

   
end



# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")

# # connect n3 to n1
# n3.parent = n1
# # connect n3 to n2
# n3.parent = n2

# # this should work
# raise "Bad parent=!" unless n3.parent == n2
# raise "Bad parent=!" unless n2.children == [n3]

# # this probably doesn't
# raise "Bad parent=!" unless n1.children == []