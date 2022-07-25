class EstabelecimentosImporter < ApiImporter
  def import
    Estados.new.all.each do |estado|
      import_estado(estado[:id])
    end
  end

  private

  def import_estado(id)
    Cidades.new(estado_id: id).all.each do |cidade|
      import_cidade(cidade[:id])
    end
  end

  def import_cidade(id)
    estabelecimentos = api.estabelecimentos(municipio: id)
    dump_json(estabelecimentos, path: "estabelecimentos-#{id}.json")
  end
end
