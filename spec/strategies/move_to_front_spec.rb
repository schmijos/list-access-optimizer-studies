require_relative '../../lib/counting_list'
require_relative '../../lib/strategies/move_to_front'

RSpec.describe Strategies::MoveToFront do
  subject(:list) do
    CountingList.new(%w[item1 item2 item3 item4]).with_optimizer do |list, current|
      described_class.optimize(list, current)
    end
  end

  it 'can optimize a list with move to front' do
    list.retrieve('item3')
    expect(list.to_a).to eql(%w[item3 item1 item2 item4])
  end

  it 'has a reduced hop count with move to front' do
    expect do
      list.retrieve('item3')
      list.retrieve('item3')
    end.to change { list.hop_count }.by(2)
  end

  context 'stress test' do
    let(:values) { File.read('spec/data/goethe_wette.txt').split(/\W+/) }

    subject(:big_list) do
      CountingList.new(values).with_optimizer do |list, current|
        described_class.optimize(list, current)
      end
    end

    it 'is optimized after a lot of accesses' do
      5000.times do
        big_list.retrieve(values.sample)
      end

      expect do
        100.times do
          big_list.retrieve(values.sample)
        end
      end.to change { big_list.hop_count }.by_at_most(100_000)
    end

    subject(:big_list_without_opt) { CountingList.new(values) }

    it 'compares optimized search with default search' do
      count_with_opt = []
      count_without_opt = []

      10.times do
        10.times do
          sample = values.sample
          big_list_without_opt.retrieve(sample)
          big_list.retrieve(sample)
        end
        count_with_opt.push(big_list.hop_count)
        count_without_opt.push(big_list_without_opt.hop_count)
      end
      sum_with_opt = count_with_opt.reduce(:+)
      sum_without_opt = count_without_opt.reduce(:+)

      expect(sum_with_opt).to be < sum_without_opt
    end
  end
end
