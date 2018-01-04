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

  @spec delete!(bitstring, pos_integer, :leave | :delete) :: Response.t(nil)
  def delete!(access_token, room_id, action_type) do
    Base.delete!(url(room_id), access_token, params: [action_type: action_type])
    |> Base.to_response!(nil)
  end
end
