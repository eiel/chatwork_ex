defmodule ChatworkEx.Endpoint.Me do
  @moduledoc """
  Me Endopoint API Intefaces.
  """

  alias ChatworkEx.Endpoint.Base
  alias ChatworkEx.Response.{ Me, RateLimit, Error }
  alias ChatworkEx.{ Response, UnauthorizedError }

  @path "me"
  @url Base.base <> @path

  def path, do: @path
  def url, do: @url

  def get!(access_token) do
    Base.get!(url, access_token)
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

  defp to_response!(response) do
    Base.to_response!(response, %Me{})
  end

end
