class CidadesImporter < ApiImporter
  def import
    Estados.new.all.each do |estado|
      save_cidades(estado[:id])
    end
  end

  private

  def save_cidades(id)
    cidades = api.cidades(id)
    dump_json(cidades, path: "cidades-#{id}.json")
  end
end
