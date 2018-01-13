defmodule ChatworkEx.Endpoint.Rooms.Messages.Unread do
  alias ChatworkEx.Endpoint.Base
  alias ChatworkEx.Response.RoomUnreadNumber

  def url(room_id), do: Base.base() <> "rooms/" <> to_string(room_id) <> "/messages/unread"

  @spec put!(bitstring, pos_integer, bitstring) :: Response.t([RoomUnreadNumber.t()])
  def put!(access_token, room_id, message_id) do
    Base.put!(url(room_id), access_token, message_id: message_id)
    |> Base.to_response!(%RoomUnreadNumber{})
  end
end
