require 'rest-client'

module Dpe
  class Communicator
    def initialize(base_url, options = {})
      @base_url = base_url
      @details_path = options[:details_path]
      @create_path = options[:create_path]
      @category = Category.new
    end

    def open_call(message, system, user_id)
      data = format_request(descricao: message, categoria: system, servidor: user_id)
      send_data(data)
    end

    def creation_url
      "#{@base_url}#{@create_path}"
    end

    def details_url
      "#{@base_url}#{@details_path}"
    end

    private

    def send_data(data)
      JSON.parse(RestClient.post(@base_url, data))
    end

    def format_request(options = {})
      {
        grupo_responsavel: 1,
        categorias: @category.system_id_for(options[:categoria]),
        label: "Chamado aberto pela Susie para #{options[:categoria]}",
        descricao: options[:descricao],
        servidores_search: options[:servidor],
        data_abertura:  DateTime.now.to_s
      }
    end
  end
end
