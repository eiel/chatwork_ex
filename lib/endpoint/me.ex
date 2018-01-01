
defmodule ChatworkEx.Endpoint.Me do
  @moduledoc """
  Me Endopoint API Intefaces.
  """

  alias ChatworkEx.Response.{ Me, RateLimit, Error }
  alias ChatworkEx.{ Response, HeaderCreator, UnauthorizedError }

  @path "me"
  @base "https://api.chatwork.com/v2/"
  @url @base <> @path

  def path, do: @path
  def url, do: @url

  def get!(access_token) do
    request!(access_token)
    |> to_response!
  end

  def get(access_token) do
    try do
      response = get!(access_token)
      {:ok, response}
    rescue
      e in UnauthorizedError ->
        {:error, e}
    end
  end

  defp request!(access_token) do
    headers = HeaderCreator.headers(access_token)
    HTTPoison.get!(@url, headers)
  end

  defp parse_header({"X-RateLimit-Limit", limit}, rate_limit), do: %{rate_limit | limit: limit}
  defp parse_header({"X-RateLimit-Remaining", remaining}, rate_limit), do: %{rate_limit | remaining: remaining}
  defp parse_header({"X-RateLimit-Reset", reset}, rate_limit), do: %{ rate_limit | reset: reset }
  defp parse_header(_, rate_limit), do: rate_limit

  defp to_response!(%HTTPoison.Response{ status_code: 200, body: body, headers: headers}) do
    body = Poison.decode! body, as: %Me{}
    rate_limit = List.foldl(headers, %RateLimit{}, &parse_header/2)
    %Response{ rate_limit: rate_limit, body: body }
  end

  defp to_response!(%HTTPoison.Response{ status_code: 401, body: body }) do
    error = Poison.decode! body, as: %Error{}
    raise UnauthorizedError, message: error
  end

end
