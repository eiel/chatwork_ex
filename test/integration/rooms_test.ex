defmodule ChatworkEx.Integration.RoomsTest do
  use ExUnit.Case

  alias ChatworkEx.Endpoint
  alias Endpoint.Rooms
  alias Endpoint.Me
  alias Endpoint.Rooms.Room
  alias ChatworkEx.Response
  alias Response.RoomId

  test "Rooms.post! & Rooms.get! Room.get! & Room.delete & Rooms.get!" do
    access_token = System.get_env("CHATWORK_TOKEN")
    name = "test room"

    # get number of room list
    %{ body: rooms } = Rooms.get!(access_token)
    before_rooms_length = length(rooms)

    # get account_id
    %{
      body: %Response.Me{
        account_id: account_id
      }
    } = Me.get!(access_token)

    # create room
    %{
      body: %RoomId{
        room_id: room_id,
      }
    } = Rooms.post!(access_token, name, account_id)

    # get number of room_list
    %{ body: rooms } = Rooms.get!(access_token)
    after_rooms_length = length(rooms)
    assert before_rooms_length+1 === after_rooms_length

    # rename room name
    new_name = "new test room"
    %{
      body: %{
        room_id: _
      }
    } = Room.put!(access_token, room_id, name: new_name)

    # get room name
    %{
      body: %Response.Room{
        name: current_name
      }
    } = Room.get!(access_token, room_id)
    assert new_name === current_name

    # delete room
    Room.delete!(access_token, room_id, :delete)

    # get number of room list
    %{ body: rooms } = Rooms.get!(access_token)
    assert before_rooms_length == length(rooms)
  end
end
