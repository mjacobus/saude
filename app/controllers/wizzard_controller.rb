class WizzardController < ApplicationController
  def estados
    @estados ||= Estados.new
  end

  def cidades
    @cidades ||= estado.cidades
  end

  def estabelecimentos
    @estabelecimentos ||= cidade.estabelecimentos
  end

  def profissionais
    @profissionais = estabelecimento.profissionais

    if params[:cargo].present?
      @profissionais = @profissionais.select do |profissional|
        profissional['dsCbo'].match(params[:cargo].upcase)
      end
    end

    render 'profissionais/index'
  end

  private

  def estado
    @estado ||= estados.find(params[:estado_id])
  end

  def cidade
    @cidade ||= cidades.find(params[:cidade_id])
  end

  def estabelecimento
    estabelecimentos.find(params[:estabelecimento_id])
  end

  def client
    @client ||= Cnes::HttpClientFactory.new.create
  end
end
