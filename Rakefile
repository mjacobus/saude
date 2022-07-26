# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

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
    ProfissionaisImporter.new.import(estado_id: 43)
  end
end

task import_all: [
  'estados:import',
  'cidades:import',
  'estabelecimentos:import',
  'profissionais:import'
]
