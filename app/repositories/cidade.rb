class Cidade < Entity
  def estabelecimentos
    Estabelecimentos.new(cidade_id: id)
  end
end
