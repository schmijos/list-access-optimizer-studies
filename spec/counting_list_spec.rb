require_relative '../lib/counting_list.rb'

RSpec.describe CountingList do
  subject(:list) { described_class.new('item1', 'item2', 'item3', 'item4') }

  it 'can retrieve an item which is present' do
    expect(list.retrieve('item4')).to eql('item4')
    expect(list.retrieve('item1')).to eql('item1')
    expect(list.retrieve('item2')).to eql('item2')
    expect(list.retrieve('item3')).to eql('item3')
  end

  it 'cannot retrieve an item which is not present' do
    expect(list.retrieve('notpresent')).to be_nil
  end

  it 'can count retrieve hops' do
    expect { list.retrieve('item2') }.to change { list.hop_count }.by(1)
    expect { list.retrieve('item4') }.to change { list.hop_count }.by(3)
  end

  it 'can convert the linked list to an array' do
    expect(list.to_a).to eql(['item1', 'item2', 'item3', 'item4'])
  end
end