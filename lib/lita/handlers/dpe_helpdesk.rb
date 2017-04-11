module Lita
  module Handlers
    class DpeHelpdesk < Handler
      SYSTEMS = %w(odin saed solar athenas).freeze
      CONTEXT_LABEL = 'open_call'.freeze

      on :shut_down_complete, :end_context
      on :unhandled_message, :inform_reason
      on :unhandled_message, :define_system

      route(/^abrir chamado$/i, :open_call)

      def open_call(response)
        response.reply(
          %(Olá, para qual sistema você deseja atendimento?)
        )
        next_step(:define_system)
      end

      def define_system(payload)
        return unless context == 'define_system'
        response = payload[:message]
        system_name = detect_system_name(response.body)
        if system_name
          response.reply(
            "Muito bem, vamos então abrir um chamado para o sistema #{system_name}. O que está acontecendo?"
          )
          next_step('inform_reason')
        else
          response.reply(
            'Não encontrei nenhum sistema com esse nome, para qual sistema você deseja atendimento?'
          )
        end
      end

      def inform_reason(payload)
        return unless context == 'inform_reason'
        response = payload[:message]
        response.reply('Obrigado! Seu chamado foi aberto com o número #N, para mais detalhes URL')
        end_context
      end

      Lita.register_handler(DpeHelpdesk)

      private

      def detect_system_name(body)
        SYSTEMS.find { |e| /^#{body}$/ =~ e }
      end

      def context
        @contetx ||= redis.get(:context)
      end

      def next_step(next_step)
        redis.set(:context, next_step)
      end

      def end_context
        redis.del(:context)
      end

      Lita.register_handler(self)
    end
  end
end
