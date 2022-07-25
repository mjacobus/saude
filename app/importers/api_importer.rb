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
