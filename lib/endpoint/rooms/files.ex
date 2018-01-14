defmodule ChatworkEx.Endpoint.Rooms.Files do
  alias ChatworkEx.Endpoint.Base
  alias ChatworkEx.Response.File
  def url(room_id), do: Base.base() <> "rooms/" <> to_string(room_id) <> "/files"

  @spec get!(bitstring, pos_integer, account_id: pos_integer) :: Response.t([File.t()])
  def get!(access_token, room_id, options \\ []) do
    Base.get!(url(room_id), access_token, options)
    |> Base.to_response!([%File{}])
  end
end
