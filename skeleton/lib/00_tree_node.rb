class PolyTreeNode

    attr_reader :parent, :children, :value
    def initialize(value)
        @value = value
        @parent = nil
        @children = []

    end

    def parent=(par) #p is an instance of another poly tree
        if self.parent
            @parent.children.inject([]) do |acc,ele|
                if ele == self
                    acc 
                else
                    acc << ele
                end
            end
        end

        return nil if nil
        @parent = par 
        par.children << self
        self
    end

   
end