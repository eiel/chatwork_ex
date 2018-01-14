defmodule ChatworkEx.Endpoint.Rooms.Messages.Message do
  alias ChatworkEx.Endpoint.Base
  alias ChatworkEx.Response.MessageId
  alias ChatworkEx.Response.Message

  @spec url(pos_integer, bitstring) :: bitstring
  def url(room_id, message_id),
    do: Base.base() <> "rooms/" <> to_string(room_id) <> "/messages/" <> message_id

  @spec get!(bitstring, pos_integer, bitstring) :: Response.t(Message.t())
  def get!(access_token, room_id, message_id) do
    Base.get!(url(room_id, message_id), access_token)
    |> Base.to_response!(%Message{})
  end

  @spec put!(bitstring, pos_integer, bitstring, bitstring) :: Response.t([MessageId.t()])
  def put!(access_token, room_id, message_id, body) do
    Base.put!(url(room_id, message_id), access_token, body: body)
    |> Base.to_response!(%MessageId{})
  end

  @spec delete!(bitstring, pos_integer, bitstring) :: Response.t([MessageId.t()])
  def delete!(access_token, room_id, message_id) do
    Base.delete!(url(room_id, message_id), access_token)
    |> Base.to_response!(%MessageId{})
  end
end
