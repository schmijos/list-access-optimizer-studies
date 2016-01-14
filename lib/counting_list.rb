Item = Struct.new(:value, :next)

class CountingList
  attr_accessor :head

  def initialize(*values, &optimizer)
    @head = nil
    values.reverse_each do |value|
      current = Item.new(value, @head)
      @head = current
    end
    @hop_count = 0
    @optimizer = optimizer if block_given?
  end

  def retrieve(value, &optimize)
    current = @head
    while current
      if current.value == value
        @optimizer.call(self, current) if @optimizer
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