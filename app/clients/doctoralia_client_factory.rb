class DoctoraliaClientFactory
  def create
    request = Koine::RestClient::Request.new(
      base_url: 'https://www.doctoralia.com.br/',
    )

    client = Koine::RestClient::Client.new(
      base_request: request,
      response_parser: HtmlResponseParser.new
    )

    DoctoraliaClient.new(client: client)
  end
end
