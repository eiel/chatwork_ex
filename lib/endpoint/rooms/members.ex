defmodule ChatworkEx.Endpoint.Rooms.Members do
  @moduledoc """
  Mmeber Endopoint API Intefaces.
  """
  alias ChatworkEx.Endpoint.Base
  alias ChatworkEx.Response
  alias Response.{ Member, RoomMemberInfo }

  def url(room_id), do: Base.base <> "rooms/" <> to_string(room_id) <> "/members"

  @spec get!(bitstring, pos_integer):: Response.t([Member.t])
  def get!(access_token, room_id) do
    Base.get!(url(room_id), access_token)
    |> Base.to_response!([%Member{}])
  end

  @type put_params :: [
    members_members_ids: pos_integer | [pos_integer],
    members_readonly_ids: pos_integer  | [pos_integer],
  ]
  @spec put!(bitstring, pos_integer | [pos_integer], put_params) :: Response.t(Room.t)
  def put!(access_token, room_id, members_admin_ids, params \\ []) do
    params = [{:members_admin_ids, members_admin_ids} | params ]
    Base.put!(url(room_id), access_token, params)
    |> Base.to_response!(%RoomMemberInfo{})
  end

end
