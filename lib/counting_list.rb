class CountingList
  def initialize(*items)
    @list = items
  end

  def retrieve(value)
    position = @list.index(value)
    @list[position] if position
  end

  def insert(value)
    @list << value
  end

  def length
    @list.length
  end

end