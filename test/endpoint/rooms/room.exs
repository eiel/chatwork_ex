defmodule ChatworkEx.Endpoint.Rooms.RoomTest do
  use ExUnit.Case

  import ChatworkEx.Endpoint.Rooms.Room

  alias ChatworkEx.Endpoint.Me
  alias ChatworkEx.Response
  alias ChatworkEx.Response.RateLimit
  alias ChatworkEx.Response.Room

  doctest ChatworkEx.Endpoint.My.Status

  test "get!" do
  access_token = System.get_env("CHATWORK_TOKEN")

  # get myroom
  %{
    body: %{
      room_id: room_id
    }
  } = Me.get!(access_token)
  %Response{
    rate_limit: %RateLimit{
      limit: _,
    },
    body: %Room{
      name: _
    },
  } = get!(access_token, room_id)
end


end
