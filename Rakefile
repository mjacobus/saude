# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"
require "fileutils"
require "awesome_print"

Rails.application.load_tasks

namespace :estados do
  task import: :environment do
    EstadosImporter.new.import
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

namespace :profissionais do
  task import: :environment do
    ProfissionaisImporter.new.import
  end
end

task import_all: [
  'estados:import',
  'cidades:import',
  'estabelecimentos:import',
  'profissionais:import'
]
