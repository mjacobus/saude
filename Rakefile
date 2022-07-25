# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"
require "fileutils"
require "awesome_print"

Rails.application.load_tasks

class ApiImporter
  attr_reader :api

  def initialize(api: Cnes::HttpClientFactory.new.create, logger: Logger.new("log/api_data.log"))
    @api = api
    @logger = logger
  end

  private

  def dump_json(data, path:)
    path = Rails.root.join("data/api").join(path)
    folder = File.basename(path)
    log("Creating file: #{path}")
    FileUtils.mkdir_p(folder)
    File.open(path, 'w') { |f| f.puts(data.to_json) }
  end

  def read_json(path)
    file = Rails.root.join("data/api").join(path)
    JSON.parse(File.read(file))
  end

  def log(message)
    @logger.info(message)
  end
end

class EstadosImporter < ApiImporter
  def import
    dump_json(api.estados, path: "estados.json")
  end
end

class CidadesImporter < ApiImporter
  def import
    Estados.new.all.each do |estado|
      save_cidades(estado[:id])
    end
  end

  private

  def save_cidades(id)
    cidades = api.cidades(id)
    dump_json(cidades, path: "cidades-#{id}.json")
  end
end

class EstabelecimentosImporter < ApiImporter
  def import
    Estados.new.all.each do |estado|
      import_estado(estado[:id])
    end
  end

  private

  def import_estado(id)
    Cidades.new(estado_id: id).all.each do |cidade|
      import_cidade(cidade[:id])
    end
  end

  def import_cidade(id)
    estabelecimentos = api.estabelecimentos(municipio: id)
    dump_json(estabelecimentos, path: "estabelecimentos-#{id}.json")
  end
end

namespace :estados do
  task import: :environment do
    Estados.new.import
  end
end

namespace :cidades do
  task import: :environment do
    CidadesImporter.new.import
  end
end

namespace :estabelecimentos do
  task import: :environment do
    EstabelecimentosImporter.new.import
  end
end
