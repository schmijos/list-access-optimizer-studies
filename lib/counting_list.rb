Item = Struct.new(:value, :next)

class CountingList
  def initialize(*items)
    @head = nil
    items.reverse_each do |value|
      current = Item.new(value, @head)
      @head = current
    end
    @hop_count = 0
  end

  def retrieve(value, &optimize)
    current = @head
    while current.next
      if current.value == value
        optimize.call(@head, current) if block_given?
        return current.value
      end

      current = current.next
      @hop_count += 1
    end
  end

  def hop_count
    @hop_count
  end
end