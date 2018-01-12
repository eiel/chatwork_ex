defmodule ChatworkEx.Endpoint.Rooms.Messages do
  alias ChatworkEx.Endpoint.Base
  alias ChatworkEx.Response.Message

  def url(room_id), do: Base.base() <> "rooms/" <> to_string(room_id) <> "/messages"

  @spec get!(bitstring, pos_integer, force: boolean) :: Response.t([Message.t()])
  def get!(access_token, room_id, options \\ []) do
    {_, options} = Keyword.get_and_update!(options, :force, fn true -> {true, 1} end)

    Base.get!(url(room_id), access_token, options)
    |> Base.to_response!([%Message{}])
  end
end
