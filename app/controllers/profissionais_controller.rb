# frozen_string_literal: true

class ProfissionaisController < ApplicationController
  def index
    if search_params_present?
      @profissionais = search

      if params[:cargo].present?
        @profissionais = @profissionais.select do |profissional|
          profissional['dsCbo'].match(params[:cargo].upcase)
        end
      end
    end
  rescue Cnes::InvalidArgumentError => error
    @error = error.message
  end

  def test
    client = Cnes::HttpClientFactory.new.create
    @profissionais = client.profissionais(4314902237253)
    render :index
  end

  private

  def search
    Rails.cache.fetch(search_params) do
      profissionais.listar(**search_params)
    end
  end

  def profissionais
    Cnes::Servicos::ProfissionaisFactory.new.create
  end

  def search_params_present?
    [params[:estado], params[:cidade], params[:estabelecimento]].all?(&:present?)
  end

  def search_params
    {

      estado: params[:estado].upcase.presence,
      cidade: params[:cidade].upcase.presence,
      estabelecimento: params[:estabelecimento].upcase.presence
    }
  end
end
