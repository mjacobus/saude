class JsonRepository
  def all
    @data
  end

  def find(&block)
    all.find(&block)
  end

  def find(id)
    find { |e| e[:id] == id }
  end

  private

  def read_file(file)
    file = Rails.root.join("data/api").join(file)
    JSON.parse(File.read(file))
  end
end
