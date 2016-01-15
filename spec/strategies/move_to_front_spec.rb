require_relative '../../lib/counting_list'
require_relative '../../lib/strategies/move_to_front'

RSpec.describe Strategies::MoveToFront do
  subject(:list) do
    CountingList.new(['item1', 'item2', 'item3', 'item4']).with_optimizer do |list, current|
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

  context 'stress test' do
    let(:values) { File.read('spec/data/goethe_wette.txt').split(/\W+/) }

    subject(:big_list) do
      CountingList.new(values).with_optimizer do |list, current|
        described_class.optimize(list, current)
      end
    end

    it 'it is optimized after a lot of accesses' do
      5000.times do
        big_list.retrieve(values.sample)
      end

      expect {
        100.times do
          big_list.retrieve(values.sample)
        end
      }.to change { big_list.hop_count }.by_at_most(100_000)
    end
  end
end