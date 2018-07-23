module Strategies
  class MoveToFront
    def self.optimize(list, last_accessed_item)
      return if last_accessed_item == list.head

      current = list.head
      current = current.next while current.next != last_accessed_item

      current.next = last_accessed_item.next
      last_accessed_item.next = list.head
      list.head = last_accessed_item
    end
  end
end
