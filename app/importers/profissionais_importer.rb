class ProfissionaisImporter < ApiImporter
  def import(estado_id: nil)
    estados = Estados.new

    if estado_id
      estados = [estados.find(estado_id)]
    end

    estados.each do |estado|
      import_estado(estado)
    end
  end

  private

  def import_estado(estado)
    estado.cidades.each do |cidade|
      import_cidade(cidade)
    end
  end

  def import_cidade(cidade)
    cidade.estabelecimentos.each do |estabelecimento|
      import_estabelecimento(estabelecimento)
    end
  end

  def import_estabelecimento(estabelecimento)
    profissionais = with_retry { api.profissionais(estabelecimento.id) }
    dump_json(profissionais, path: "profissionais-#{estabelecimento.id}.json")
  end
end
