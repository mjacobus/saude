class Estabelecimento < Entity
  def nome
    self[:noEmpresarial]
  end

  def profissionais
    Profissionais.new(estabelecimento_id: id)
  end
end
