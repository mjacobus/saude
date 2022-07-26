class EstabelecimentosImporter < ApiImporter
  def import
    Estados.new.each do |estado|
      import_estado(estado)
    end
  end

  private

  def import_estado(estado)
    estado.cidades.each do |cidade|
      import_cidade(cidade.id)
    end
  end

  def import_cidade(id)
    estabelecimentos = with_retry { api.estabelecimentos(municipio: id) }
    dump_json(estabelecimentos, path: "estabelecimentos-#{id}.json")
  end
end
