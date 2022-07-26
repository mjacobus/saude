class CidadesImporter < ApiImporter
  def import
    Estados.new.each do |estado|
      save_cidades(estado.id)
    end
  end

  private

  def save_cidades(id)
    cidades = with_retry { api.cidades(id) }
    dump_json(cidades, path: "cidades-#{id}.json")
  end
end
