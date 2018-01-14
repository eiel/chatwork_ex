defmodule ChatworkEx.Endpoint.FilesTest do
  use ExUnit.Case

  import ChatworkEx.Endpoint.Rooms.Files

  alias ChatworkEx.Endpoint.Me

  test "get!" do
    access_token = System.get_env("CHATWORK_TOKEN")

    # get myroom
    %{
      body: %{
        room_id: room_id
      }
    } = Me.get!(access_token)

    %{
      rate_limit: _,
      body: _
    } = get!(access_token, room_id)
  end
end
