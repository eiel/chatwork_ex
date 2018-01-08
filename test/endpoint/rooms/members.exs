defmodule ChatworkEx.Endpoint.Room.Members do
  @other_account_id 2834365

  use ExUnit.Case

  import ChatworkEx.Endpoint.Rooms.Members
  alias ChatworkEx.Endpoint.Me
  alias ChatworkEx.Endpoint.Rooms
  alias ChatworkEx.Endpoint.Rooms.Room
  alias ChatworkEx.Response.Member
  alias ChatworkEx.Response.RoomMemberInfo

  setup do
    access_token = System.get_env("CHATWORK_TOKEN")
    %{
       body: %{
         account_id: account_id,
       },
     } = Me.get!(access_token)

    {:ok, access_token: access_token, account_id: account_id}
  end

  test "get", context do
    %{
      access_token: access_token,
      account_id: account_id,
    } = context

    %{
      body: %{
        room_id: room_id,
      },
    } = Rooms.post!(access_token, "member test", account_id )

    %{
      body: [
        %Member{
          account_id: _,
        }
      ]
    } = get!(access_token, room_id)

    Room.delete!(access_token, room_id, :delete)
  end

  test "put", context do
    %{
      access_token: access_token,
      account_id: account_id,
    } = context

    %{
      body: %{
        room_id: room_id,
      },
     } = Rooms.post!(access_token, "member test put", account_id )

    %{
      body: %RoomMemberInfo {
        readonly: [@other_account_id]
      }
    } = put!(
      access_token,
      room_id,
      account_id,
      members_readonly_ids: @other_account_id,
    )

    Room.delete!(access_token, room_id, :delete)
  end

end
