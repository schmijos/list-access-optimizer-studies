require_relative '../lib/counting_list.rb'

RSpec.describe CountingList do
  subject(:list) { CountingList.new('blub', 'lol') }

  it 'can retrieve an item which is present' do
    expect(list.retrieve('blub')).to eql('blub')
  end

  it 'cannot retrieve an item which is not present' do
    expect(list.retrieve('gach')).to be_nil
  end

  it 'can insert key and item' do
    expect { list.insert('value') }.to change{ list.length }.from(2).to(3)

    expect(list.retrieve('value')).to eql('value')
  end
end