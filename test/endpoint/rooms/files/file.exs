defmodule ChatworkEx.Endpoint.Files.FileTest do
  use ExUnit.Case

  import ChatworkEx.Endpoint.Rooms.Files.File

  alias ChatworkEx.Endpoint.Me
  alias ChatworkEx.Errors.NotFoundError

  test "get!" do
    access_token = System.get_env("CHATWORK_TOKEN")

    # get myroom
    %{
      body: %{
        room_id: room_id
      }
    } = Me.get!(access_token)

    file_id = 1

    assert_raise NotFoundError, fn ->
      get!(access_token, room_id, file_id)
    end
  end
end
