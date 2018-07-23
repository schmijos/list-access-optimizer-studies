require_relative '../../lib/counting_list'
require_relative '../../lib/strategies/your_own_strategy'

RSpec.describe Strategies::YourOwnStrategy do
  subject(:list) do
    CountingList.new(['item1', 'item2', 'item3', 'item4']).with_optimizer do |list, current|
      described_class.optimize(list, current)
    end
  end

  it 'can optimize a list' do
    # TODO: implement test
  end

  it 'has a reduced hop count' do
    # TODO: implement test
  end
end