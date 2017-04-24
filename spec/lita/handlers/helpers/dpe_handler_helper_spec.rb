require 'spec_helper'

describe DpeHelpdeskHelper do
  include DpeHelpdeskHelper

  let(:array) { (1..9).to_a }

  it '#split_array' do
    expect(split_array(array, 3)).to eq([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
  end

end
