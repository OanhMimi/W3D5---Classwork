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