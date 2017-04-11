require 'spec_helper'

describe Dpe::Communicator do
  let(:comm) do
    Dpe::Communicator.new(url,
                          systems_map: systems_map,
                          details_path: details_path,
                          create_path: create_path)
  end

  let(:url) { 'test.url' }
  let(:details_path) { '/details' }
  let(:create_path) { '/create' }
  let(:systems_map) { { 'test' => 0 } }

  it '#creation_url' do
    expect(comm.creation_url).to eq("#{url}#{create_path}")
  end

  it '#details_url' do
    expect(comm.details_url).to eq("#{url}#{details_path}")
  end

end
