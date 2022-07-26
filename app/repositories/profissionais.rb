class Profissionais < JsonRepository
  def initialize(estabelecimento_id:)
    @data = read_file("profissionais-#{estabelecimento_id}.json").map do |data|
      Profissional.new(**data.symbolize_keys)
    end
  end
end

