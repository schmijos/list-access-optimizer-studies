Item = Struct.new(:value, :next)

class CountingList
  def initialize(*items)
    last_current = nil
    items.reverse_each do |value|
      current = Item.new(value, last_current)
      last_current = current
    end
    @head = last_current
    @hop_count = 0
  end

  def retrieve(value)
    current = @head
    while current.next
      return current.value if current.value == value

      current = current.next
      @hop_count += 1
    end
  end

  def hop_count
    @hop_count
  end
end