# frozen_string_literal: true

class DoctoraliaClient
  def initialize(client:)
    @client = client
  end

  def search(term, params = {})
    @client.get("/pesquisa", params.merge(q: term))
  end
end
