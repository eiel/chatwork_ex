defmodule ChatworkEx.Endpoint.Contacts do
  @moduledoc """
  Me Endopoint API Intefaces.
  """

  alias ChatworkEx.Endpoint.Base
  alias ChatworkEx.Response.Contact
  alias ChatworkEx.{Response, UnauthorizedError}

  @path "contacts"
  @url Base.base() <> @path

  def path, do: @path
  def url, do: @url

  @spec get!(bitstring) :: Response.t([Contact.t()])
  def get!(access_token) do
    Base.get!(url(), access_token)
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
    Base.to_response!(response, [%Contact{}])
  end
end
