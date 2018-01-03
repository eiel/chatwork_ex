defmodule ChatworkEx.Endpoint.Rooms do
  @moduledoc """
  Me Endopoint API Intefaces.
  """

  alias ChatworkEx.Endpoint.Base
  alias ChatworkEx.Response.{ Room, RateLimit, Error }
  alias ChatworkEx.{ Response, UnauthorizedError }

  @path "rooms"
  @url Base.base <> @path

  def path, do: @path
  def url, do: @url

  @spec get!(bitstring) :: Response.t([Room.t])
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
    Base.to_response!(response, [%Room{}])
  end

end
