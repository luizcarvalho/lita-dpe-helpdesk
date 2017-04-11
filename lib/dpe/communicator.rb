require 'rest-client'
module Dpe
  class Communicator
    def initialize(url, details_path, systems_map)
      @url = url
      @details_path = details_path
      @systems_map = systems_map
    end

    def open_call(message, system, user_id)
      data = format_request(message, system, user_id)
      send_data(data)
    end

    private

    def send_data(data)
      JSON.parse(RestClient.post(@url, data))
    end

    def system_id_for(system_name)
      @systems_map[system_name.downcase]
    end

    def format_request(descricao, servidores_search, categoria)
      {
        grupo_responsavel: 1,
        categorias: system_id_for(categoria),
        label: "Chamado aberto pela Susie para #{categoria}",
        descricao: descricao,
        servidores_search: servidores_search,
        data_abertura:  DateTime.now.to_s
      }
    end
  end
end
