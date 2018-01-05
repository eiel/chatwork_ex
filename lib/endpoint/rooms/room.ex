defmodule ChatworkEx.Endpoint.Rooms.Room do
  @moduledoc """
  Room Endopoint API Intefaces.
  """
  alias ChatworkEx.Endpoint.Base
  alias ChatworkEx.Response.{ Room, RoomId, RateLimit, Error }
  alias ChatworkEx.{ Response, UnauthorizedError }

  @path "rooms/"
  @url Base.base <> @path

  def path, do: @path
  def url(room_id), do: @url <> to_string(room_id)

  @spec get!(bitstring, pos_integer):: Response.t(Room.t)
  def get!(access_token, room_id) do
    Base.get!(url(room_id), access_token)
    |> Base.to_response!(%Room{})
  end

  @type put_params :: [
    description: bitstring,
    icon_preset: Room.icon_preset,
    name: bitstring,
  ]
  @spec put!(bitstring, pos_integer, put_params) :: Response.t(Room.t)
  def put!(access_token, room_id, params) do
    Base.put!(url(room_id), access_token, params)
    |> Base.to_response!(%Room{})
  end

  @spec delete!(bitstring, pos_integer, :leave | :delete) :: Response.t(nil)
  def delete!(access_token, room_id, action_type) do
    Base.delete!(url(room_id), access_token, params: [action_type: action_type])
    |> Base.to_response!(nil)
  end
end
