defmodule ChatworkEx.Endpoint.Rooms.Messages.Read do
  alias ChatworkEx.Endpoint.Base
  alias ChatworkEx.Response.RoomUnreadNumber

  def url(room_id), do: Base.base() <> "rooms/" <> to_string(room_id) <> "/messages/read"

  @spec put!(bitstring, pos_integer, message_id: bitstring) :: Response.t([RoomUnreadNumber.t()])
  def put!(access_token, room_id, options \\ []) do
    Base.put!(url(room_id), access_token, options)
    |> Base.to_response!(%RoomUnreadNumber{})
  end
end
