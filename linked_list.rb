#   => next : stores the next Node in the Linked List.
#   => value: stores the value of the current list element.

class Node
    attr_accessor :value, :next

    def initialize(value)
        @value = value
    end
end

#   => head : pointer to the head of the Linked List.
#   => tail : pointer to the tail of the Linked List.

class LinkedList
    attr_accessor :head, :tail

    def initialize (head)
        raise "LinkedList must be initialized with a Node." unless head.is_a?(Node)

        @head = head
        @tail = head
    end

    def insert(node)
        @tail.next = node
        @tail = @tail.next
    end

    def print
        current_node = @head

        while current_node != nil
            puts "\tLL Node Value = #{current_node.value}"
            current_node = current_node.next
        end
    end

    def iterate
        if block_given?
            current_node = @head

            while current_node != nil
                yield current_node.value
                current_node = current_node.next
            end
        else
            print
        end
    end
end

linked = Node.new(1)
list = LinkedList.new(linked)

(2..5).each {|n| list.insert(Node.new(n)) }


list.print

list.iterate

list.iterate {|n| puts "\tLL Node Value squared = #{n ** 2}"}
