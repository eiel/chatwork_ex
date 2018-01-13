defmodule ChatworkEx.Integration.ReadUnreadTest do
  use ExUnit.Case

  alias ChatworkEx.Endpoint
  alias Endpoint.Me
  alias Endpoint.Rooms.Messages
  alias Messages.Read
  alias Messages.Unread

  test "post message -> read -> unread" do
    access_token = System.get_env("CHATWORK_TOKEN")

    # get myroom
    %{
      body: %{
        room_id: room_id
      }
    } = Me.get!(access_token)

    %{
      body: %{message_id: message_id}
    } = Messages.post!(access_token, room_id, "integartion read unread")

    %{
      body: %{
        unread_num: after_unread_num
      }
    } = Read.put!(access_token, room_id)

    %{
      body: %{
        unread_num: unread_num
      }
    } = Unread.put!(access_token, room_id, message_id)

    assert(unread_num - 1 == after_unread_num)
  end
end
