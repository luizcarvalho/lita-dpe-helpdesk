require 'spec_helper'

describe Dpe::Communicator do
  let(:comm) do
    Dpe::Communicator.new(url,
                          details_path: details_path,
                          create_path: create_path)
  end

  let(:url) { 'helpdesk.url' }
  let(:details_path) { '/details' }
  let(:create_path) { '/create' }

  describe 'urls' do
    it '#creation_url' do
      expect(comm.creation_url).to eq("#{url}#{create_path}")
    end

    it '#details_url' do
      expect(comm.details_url).to eq("#{url}#{details_path}")
    end
  end

  describe '#open_call' do
    before(:each){ stub_helpdesk(expect_id: 1) }
    let(:result) { comm.open_call('my problem', 'test', 1) }

    it 'sucessful' do
      expect(result).not_to be nil
    end

    it 'return helpdesk id' do
      expect(result['id']).to  be(1)
    end
  end
end
