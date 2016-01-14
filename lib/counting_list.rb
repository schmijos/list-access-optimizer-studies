Item = Struct.new(:value, :previous, :next)

class CountingList
  def initialize(*items)
    @head = nil
    items.reverse_each do |value|
      current = Item.new(value, nil, @head)
      @head = current
    end
    @hop_count = 0
  end

  def retrieve(value, &optimize)
    current = @head
    while current
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

  def to_a
    result = []
    current = @head
    while current
      result << current.value
      current = current.next
    end
    result
  end
end