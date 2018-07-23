require_relative '../lib/counting_list.rb'

RSpec.describe CountingList do
  subject(:list) { described_class.new(%w[item1 item2 item3 item4]) }

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
    expect(list.to_a).to eql(%w[item1 item2 item3 item4])
  end

  context 'stress test' do
    let(:values) { File.read('spec/data/goethe_wette.txt').split(/\W+/) }
    subject(:big_list) { CountingList.new(values) }

    it 'accesses an element always the same way' do
      5000.times do
        big_list.retrieve(values[100])
      end

      expect do
        big_list.retrieve(values[100])
      end.to change { big_list.hop_count }.by(100)
    end
  end
end
