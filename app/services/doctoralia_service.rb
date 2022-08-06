class DoctoraliaService
  def initialize(client:)
    @client = client
  end

  def buscar_telefone(nome_medico)
    html = @client.search(nome_medico, loc: "Sapiranga")

    doc = Nokogiri::HTML.parse(html)

    # url = doc.css("#search-content").css("h3").first.css("a").first.attr(:href)
    urls = doc.css("#search-content h3 a").map { |a| a.attr(:href) }
    p urls
    binding.pry
  end
end
