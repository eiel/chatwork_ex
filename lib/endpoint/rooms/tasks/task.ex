defmodule ChatworkEx.Endpoint.Rooms.Tasks.Task do
  alias ChatworkEx.Endpoint.Base
  alias ChatworkEx.Response.Task

  @spec url(pos_integer, pos_integer) :: bitstring
  def url(room_id, task_id) do
    Base.base() <> "rooms/" <> to_string(room_id) <> "/tasks/" <> to_string(task_id)
  end

  @spec get!(bitstring, pos_integer, pos_integer) :: Response.t(Task.t())
  def get!(access_token, room_id, task_id) do
    Base.get!(url(room_id, task_id), access_token)
    |> Base.to_response!(%Task{})
  end
end
