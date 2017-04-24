module Lita
  module Handlers
    class DpeHelpdesk < Handler
      CONTEXT_LABEL = 'open_call'.freeze

      on :shut_down_complete, :end_context
      on :unhandled_message, :inform_reason
      on :unhandled_message, :define_system

      route(/^abrir chamado$/i, :open_call)
      route(%r{^/nomes_sistemas$}, :categories_names)

      def open_call(response)
        response.reply(t('start_call'))
        next_step(:define_system)
      end

      def categories_names(response)
        response.reply(telegram_keyboard('Selecione algum dos sistemas abaixo:', category.names))
        next_step(:define_system)
      end

      def define_system(payload)
        return unless context == 'define_system'
        response = payload[:message]
        system_name = detect_system_name(response.body)
        if system_name
          response.reply(t('reason', system_name: system_name))
          next_step('inform_reason')
        else
          response.reply(t('category_not_found'))
        end
      end

      def inform_reason(payload)
        return unless context == 'inform_reason'
        response = payload[:message]
        response.reply(
          t('finalize', numero: '#N', url: 'URL')
        )
        end_context
      end

      Lita.register_handler(DpeHelpdesk)

      private

      def json_template(template_name, locals = {})
        JSON.parse(render_template(template_name, **locals), symbolize_names: true)
      end

      def category
        @category ||= Category.new
      end

      def detect_system_name(body)
        category.compare(body)
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
