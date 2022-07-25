class Estados < JsonRepository
  def initialize
    @data = read_file("estados.json").map do |id, nome|
      { id: id, nome: nome }
    end
  end
end
