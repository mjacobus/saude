class WizzardController < ApplicationController
  def estados
    @estados = Rails.cache.fetch('estados') do
      client.estados
    end
  end

  def cidades
    @cidades = Rails.cache.fetch('cidades') do
      client.cidades(params.fetch(:estado_id))
    end
  end

  def estabelecimentos
    payload = {
      municipio: params[:cidade_id],
      nome: params[:nome],
    }.compact_blank

    key = { action: params[:action] }.merge(payload)

    @estabelecimentos = Rails.cache.fetch(key) do
      client.estabelecimentos(payload)
    end
  end

  def profissionais
    id = params[:estabelecimento_id]
    key = ['profissionais', id].join(':')

    @profissionais = Rails.cache.fetch(key) do
      client.profissionais(id)
    end

    if params[:cargo].present?
      @profissionais = @profissionais.select do |profissional|
        profissional['dsCbo'].match(params[:cargo].upcase)
      end
    end

    render 'profissionais/index'
  end

  private

  def client
    @client ||= Cnes::HttpClientFactory.new.create
  end
end
