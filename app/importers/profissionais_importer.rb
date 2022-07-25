class ProfissionaisImporter < ApiImporter
  def import(estado_id:)
    estados = Estados.new
    estado = estados.find(estado_id)
    import_estado(estado)
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
    profissionais = api.profissionais(estabelecimento.id)
    dump_json(profissionais, path: "profissionais-#{estabelecimento.id}")
  end
end
