class Cidades < JsonRepository
  def initialize(estado_id:)
    @data = read_file("cidades-#{estado_id}.json").map do |id, nome|
      { id: id, nome: nome }
    end
  end
end
