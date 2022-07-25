class Entity
  def initialize(**data)
    @data = data
  end

  def to_h
    @data
  end

  def [](key)
    @data.fetch(key)
  end

  def method_missing(method, *args, **options)
    if @data.key?(method)
      return @data[method]
    end
    super
  end
end
