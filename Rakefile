# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"
require "fileutils"
require "awesome_print"

Rails.application.load_tasks

class ApiData
  attr_reader :api

  def initialize(api: Cnes::HttpClientFactory.new.create, logger: Logger.new("log/api_data.log"))
    @api = api
    @logger = logger
  end

  private

  def dump_json(data, path:)
    path = Rails.root.join(path)
    folder = File.basename(path)
    log("Creating file: #{path}")
    FileUtils.mkdir_p(folder)
    File.open(path, 'w') { |f| f.puts(data.to_json) }
  end

  def log(message)
    @logger.info(message)
  end
end

class Estados < ApiData
  def save
    dump_json(api.estados, path: "data/api/estados.json")
  end
end

namespace :estados do
  task save: :environment do
    Estados.new.save
  end
end
