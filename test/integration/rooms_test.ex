defmodule ChatworkEx.Integration.RoomsTest do
  use ExUnit.Case

  alias ChatworkEx.Endpoint
  alias Endpoint.Rooms
  alias Endpoint.Me
  alias Endpoint.Rooms.Room
  alias ChatworkEx.Response
  alias Response.RateLimit
  alias Response.RoomId

  test "Rooms.post! & Room.delete" do
    access_token = System.get_env("CHATWORK_TOKEN")

    %{ body: rooms } = Rooms.get!(access_token)
    before_rooms_length = length(rooms)

    %{ body: me } = Me.get!(access_token)

    %Response{
      rate_limit: %RateLimit{
        limit: _,
        remaining: _,
        reset: _,
      },
      body: %RoomId{
        room_id: room_id,
      }
    } = Rooms.post!(access_token, "test room", me.account_id)

    %{ body: rooms } = Rooms.get!(access_token)
    after_rooms_length = length(rooms)
    assert before_rooms_length+1 === after_rooms_length

    Room.delete!(access_token, room_id, :delete)

    %{ body: rooms } = Rooms.get!(access_token)
    assert before_rooms_length == length(rooms)
  end
end
