defmodule ChatworkEx.Endpoint.Base do
  alias ChatworkEx.HeaderCreator
  alias ChatworkEx.Response
  alias ChatworkEx.Response.RateLimit
  alias ChatworkEx.Response.Error
  alias ChatworkEx.UnauthorizedError

  @base "https://api.chatwork.com/v2/"

  def base, do: @base

  def request!(access_token, url) do
    headers = HeaderCreator.headers(access_token)
    HTTPoison.get!(url, headers)
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
    %HTTPoison.Response{ status_code: 401, body: body },
    struct
  ) do
    error = Poison.decode! body, as: %Error{}
    raise UnauthorizedError, message: error
  end
end
