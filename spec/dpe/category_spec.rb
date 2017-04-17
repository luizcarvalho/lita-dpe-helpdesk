require 'spec_helper'
describe Category do
  let(:category) { Category.new }

  before(:each) do
    stub_const("Category::MAP", {'test'=>'0'})
  end

  it '#system_id_for' do
    expect(category.system_id_for('test')).to eq('0')
  end

  it '#names' do
    expect(category.names).to eq(['test'])
  end

end
