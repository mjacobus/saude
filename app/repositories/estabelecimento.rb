class Estabelecimento < Entity
  def profissionais
    Profissionais.new(estabelecimento_id: id)
  end
end
