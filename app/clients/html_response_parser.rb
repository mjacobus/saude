class HtmlResponseParser
  def parse(response)
    if block_given?
      yield(response)
    end

    code = Integer(response.code)

    if code.between?(200, 299)
      return response.body
    end

    raise error_for_code(code), response
  end

  private

  def error_for_code(code)
    {
      400 => BadRequestError,
      404 => NotFoundError,
      500 => InternalServerError
    }.fetch(code) { Error }
  end
end
