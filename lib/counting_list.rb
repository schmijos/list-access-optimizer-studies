class CountingList
  def initialize(*items)
    @list = items
    @hop_count = 0
  end

  def retrieve(value)
    position = @list.index(value)
    if position
      @hop_count += position
      @list[position]
    end
  end

  def insert(value)
    @list << value
  end

  def length
    @list.length
  end

  def hop_count
    @hop_count
  end
end