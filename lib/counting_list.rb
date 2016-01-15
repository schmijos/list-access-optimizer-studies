Item = Struct.new(:value, :next)

class CountingList
  attr_accessor :head

  def initialize(values)
    @head = nil
    values.reverse_each do |value|
      current = Item.new(value, @head)
      @head = current
    end
    @hop_count = 0
  end

  def with_optimizer(&optimizer)
    @optimizer = optimizer
    self
  end

  def retrieve(value)
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