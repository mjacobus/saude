class JsonRepository
  include Enumerable

  def each(&block)
    @data.each(&block)
  end

  def all
    @data
  end

  def find(id)
    all.find { |e| e.id == Integer(id) }
  end

  private

  def read_file(file)
    file = Rails.root.join("data/api").join(file)
    JSON.parse(File.read(file))
  end
end
