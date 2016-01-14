require_relative '../lib/counting_list.rb'

RSpec.describe CountingList do
  subject(:list) { described_class.new('item1', 'item2', 'item3', 'item4') }

  it 'can retrieve an item which is present' do
    expect(list.retrieve('item2')).to eql('item2')
  end

  it 'cannot retrieve an item which is not present' do
    expect(list.retrieve('notpresent')).to be_nil
  end

  it 'can insert items' do
    expect {
      list.insert('value1')
      list.insert('value2')
    }.to change { list.length }.by(2)

    expect(list.retrieve('value1')).to eql('value1')
    expect(list.retrieve('value2')).to eql('value2')
  end
end