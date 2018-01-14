defmodule ChatworkEx.Endpoint.IncomingRequests do
  alias ChatworkEx.Endpoint.Base
  alias ChatworkEx.Response
  alias ChatworkEx.Response.Request

  def url(), do: Base.base() <> "/incoming_requests"

  @spec get!(bitstring) :: Response.t([Request.t()])
  def get!(access_token) do
    Base.get!(url(), access_token)
    |> Base.to_response!([%Request{}])
  end
end
