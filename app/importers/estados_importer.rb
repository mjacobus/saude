class EstadosImporter < ApiImporter
  def import
    dump_json(api.estados, path: "estados.json")
  end
end
