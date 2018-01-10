defmodule ChatworkEx.Endpoint.Base do

  alias ChatworkEx.HeaderCreator
  alias ChatworkEx.ParameterNormalizer
  alias ChatworkEx.Response
   alias ChatworkEx.Response.RateLimit
  alias ChatworkEx.Response.Error
  alias ChatworkEx.Errors.BadClientError
  alias ChatworkEx.Errors.UnauthorizedError

  @base "https://api.chatwork.com/v2/"

  def base, do: @base

  def get!(url, access_token, options \\ []) do
    headers = HeaderCreator.headers(access_token)
    url = case options do
      [] -> url
      _ -> url <> "?" <> URI.encode_query(options)
    end
    HTTPoison.get!(url, headers)
  end

  def post!(url, access_token, body \\ []) do
    body = ParameterNormalizer.normalize(body)
    headers = HeaderCreator.headers(access_token)
    HTTPoison.post!(url, {:form, body}, headers)
  end

  def put!(url, access_token, body \\ []) do
    headers = HeaderCreator.headers(access_token)
    HTTPoison.put!(url, {:form, body}, headers)
  end

  def delete!(url, access_token, options \\ []) do
    headers = HeaderCreator.headers(access_token)
    HTTPoison.delete!(url, headers, options)
  end

  def parse_header({"X-RateLimit-Limit", limit}, rate_limit), do: %{rate_limit | limit: limit}
  def parse_header({"X-RateLimit-Remaining", remaining}, rate_limit), do: %{rate_limit | remaining: remaining}
  def parse_header({"X-RateLimit-Reset", reset}, rate_limit), do: %{ rate_limit | reset: reset }
  def parse_header(_, rate_limit), do: rate_limit

  def to_response!(
    %HTTPoison.Response{ status_code: 200, body: body, headers: headers},
    struct
  ) do
    body = Poison.decode!(body, as: struct)
    rate_limit = List.foldl(headers, %RateLimit{}, &parse_header/2)
    %Response{ rate_limit: rate_limit, body: body }
  end

  def to_response!(
    %HTTPoison.Response{ status_code: 204, headers: headers },
    _struct
  ) do
    rate_limit = List.foldl(headers, %RateLimit{}, &parse_header/2)
    %Response{ rate_limit: rate_limit, body: nil }
  end

  def to_response!(
    %HTTPoison.Response{ status_code: 401, body: body },
    _struct
  ) do
    error = Poison.decode! body, as: %Error{}
    raise UnauthorizedError, message: error
  end

  def to_response!(
    %HTTPoison.Response{ status_code: 403, body: body },
    _struct
  ) do
    error = Poison.decode! body, as: %Error{}
    raise BadClientError, message: error
  end

end
