class EstadosImporter < ApiImporter
  def import
    estados = with_retry { api.estados }
    dump_json(estados, path: "estados.json")
  end
end
