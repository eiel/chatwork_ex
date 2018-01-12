defmodule ChatworkEx.Endpoint.Rooms.MessagesTest do
  use ExUnit.Case

  import ChatworkEx.Endpoint.Rooms.Messages

  alias ChatworkEx.Endpoint.Me
  alias ChatworkEx.Response
  alias Response.RateLimit
  alias Response.Message
  alias Response.MessageId

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
        limit: _
      },
      body: messages
    } = get!(access_token, room_id, force: true)

    %Message{
      body: _
    } = hd(messages)
  end

  test "post!" do
    access_token = System.get_env("CHATWORK_TOKEN")
    # get myroom
    %{
      body: %{
        room_id: room_id
      }
    } = Me.get!(access_token)

    %Response{
      rate_limit: %RateLimit{
        limit: _
      },
      body: message_id
    } = post!(access_token, room_id, "hello ChatWork")

    %MessageId{
      message_id: _
    } = message_id
  end
end
