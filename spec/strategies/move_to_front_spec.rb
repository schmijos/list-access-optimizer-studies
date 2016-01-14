require_relative '../../lib/strategies/move_to_front'

RSpec.describe Strategies::MoveToFront do
  subject(:list) do
    CountingList.new('item1', 'item2', 'item3', 'item4').with_optimizer do |list, current|
      described_class.optimize(list, current)
    end
  end

  it 'can optimize a list with move to front' do
    list.retrieve('item3')
    expect(list.to_a).to eql(['item3', 'item1', 'item2', 'item4'])
  end

  it 'has a reduced hop count with move to front' do
    expect {
      list.retrieve('item3')
      list.retrieve('item3')
    }.to change { list.hop_count }.by(2)
  end
end