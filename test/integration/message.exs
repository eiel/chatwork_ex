defmodule ChatworkEx.Integartion.MessageTest do
  use ExUnit.Case

  alias ChatworkEx.Endpoint
  alias Endpoint.Me
  alias Endpoint.Rooms.Messages
  alias Endpoint.Rooms.Messages.Message

  test """
  * post messages
  * update message
  * get message
  * delete message
  * get message
  """ do
    access_token = System.get_env("CHATWORK_TOKEN")

    # get myroom
    %{
      body: %{
        room_id: room_id
      }
    } = Me.get!(access_token)

    %{
      body: %{message_id: message_id}
    } = Messages.post!(access_token, room_id, "integartion message")

    updated_message = "integration update message"

    %{
      body: %{message_id: ^message_id}
    } = Message.put!(access_token, room_id, message_id, updated_message)

    # updated_message
    %{
      body: %{body: ^updated_message}
    } = Message.get!(access_token, room_id, message_id)

    Message.delete!(access_token, room_id, message_id)

    # deleted message
    %{
      body: %{body: "[deleted]"}
    } = Message.get!(access_token, room_id, message_id)
  end
end
