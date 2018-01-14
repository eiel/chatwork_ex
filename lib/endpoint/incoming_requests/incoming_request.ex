defmodule ChatworkEx.Endpoint.IncomingRequests.IncommingRequest do
  alias ChatworkEx.Endpoint.Base
  alias ChatworkEx.Response
  alias ChatworkEx.Response.Contact

  def url(request_id), do: Base.base() <> "/incoming_requests/" <> to_string(request_id)

  @spec put!(bitstring, pos_integer) :: Response.t(Contact.t())
  def put!(access_token, request_id) do
    Base.put!(url(request_id), access_token)
    |> Base.to_response!(%Contact{})
  end

  @spec delete!(bitstring, pos_integer) :: nil
  def delete!(access_token, request_id) do
    Base.delete!(url(request_id), access_token)
    |> Base.to_response!(nil)
  end
end
