class Estado < Entity
  def cidades
    Cidades.new(estado_id: id)
  end
end
