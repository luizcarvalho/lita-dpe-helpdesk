module Telegram
  module Bot
    class Api
      def directly_call(endpoint, raw_params)
        response = conn.post("/bot#{token}/#{endpoint}", raw_params)
        if response.status == 200
          JSON.parse(response.body)
        else
          raise Exceptions::ResponseError.new(response),
                'Telegram API has returned the error.'
        end
      end
    end
  end
end
