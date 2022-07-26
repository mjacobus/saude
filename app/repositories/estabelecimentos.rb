class Estabelecimentos < JsonRepository
  def initialize(cidade_id:)
    @data = read_file("estabelecimentos-#{cidade_id}.json").map do |data|
      Estabelecimento.new(**data.symbolize_keys)
    end
  end
end
