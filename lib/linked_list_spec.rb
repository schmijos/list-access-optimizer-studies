require './linked_list.rb'

RSpec.describe LinkedList do
  subject(:list) { LinkedList.new }

  it 'can retrieve an item' do
    expect(list.retrieve('blub')).to eql(1)
  end

end