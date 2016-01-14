require_relative '../counting_list'

module Strategies
  class MoveToFront
    def self.optimize(list, last_accessed_item)
      return if last_accessed_item == list.head

      current = list.head
      while current.next != last_accessed_item
        current = current.next
      end

      current.next = last_accessed_item.next
      last_accessed_item.next = list.head
      list.head = last_accessed_item
    end
  end
end