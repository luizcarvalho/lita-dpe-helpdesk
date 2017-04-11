require "spec_helper"
# https://github.com/jimmycuadra/lita-karma/blob/master/spec/lita/handlers/karma/chat_spec.rb
describe Lita::Handlers::DpeHelpdesk, lita_handler: true do
  let(:robot) { Lita::Robot.new(registry) }
  subject { described_class.new(robot) }

  it { is_expected.to route('abrir chamado').to(:open_call) }

  describe '#open_call' do
    before(:each){ send_message('abrir chamado') }
    let(:define_system_question) { 'para qual sistema' }

    it 'abrir chamado' do
      expect(replies.last).to include(define_system_question)
    end

    describe '#define_system' do
      it 'valid' do
        send_message('odin')
        expect(replies.last).to include('abrir um chamado para o sistema odin')
      end

      it 'invalid' do
        send_message('invalid')
        expect(replies.last).to include(define_system_question)
      end
    end

    describe '#inform_reason' do
      before(:each) do
        send_message('abrir chamado')
        send_message('odin')
      end

      it 'reason' do
        send_message('Just, down work!')
        expect(replies.last).to include('chamado foi aberto')
      end

    end


  end

end
