class JsonRepository
  include Enumerable

  NotFoundError = Class.new(RuntimeError)

  def each(&block)
    @data.each(&block)
  end

  def all
    @data
  end

  def size
    all.size
  end

  def length
    size
  end

  def find(id)
    all.find { |e| e.id == Integer(id) }
  end

  private

  def read_file(file)
    file = Rails.root.join("data/api").join(file)
    unless File.exist?(file)
      raise NotFoundError
    end
    JSON.parse(File.read(file))
  end
end
