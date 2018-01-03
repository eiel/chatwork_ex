defmodule ChatworkEx.Endpoint.RoomsTest do
  use ExUnit.Case

  import ChatworkEx.Endpoint.Rooms

  alias ChatworkEx.Endpoint.Me
  alias ChatworkEx.Response
  alias ChatworkEx.Response.Room
  alias ChatworkEx.Response.RoomId
  alias ChatworkEx.Response.RateLimit

  doctest ChatworkEx.Endpoint.Rooms

  test "url" do
    assert url() == "https://api.chatwork.com/v2/rooms"
  end

  test "get!" do
    access_token = System.get_env("CHATWORK_TOKEN")
    %Response{
      rate_limit: %RateLimit{
        limit: _,
        remaining: _,
        reset: _,
      },
      body: rooms
    } = get!(access_token)
    %Room {
      room_id: _,
    } = hd(rooms)
  end

  test "post!" do
    access_token = System.get_env("CHATWORK_TOKEN")
    %{ body: me } = Me.get!(access_token)
    %Response{
      rate_limit: %RateLimit{
        limit: _,
        remaining: _,
        reset: _,
      },
      body: %RoomId{
        room_id: _,
      }
    } = post!(access_token, "test room", me.account_id)
  end
end
