defmodule ChatworkEx.Integration.TaskTest do
  use ExUnit.Case

  alias ChatworkEx.Endpoint
  alias Endpoint.Me
  alias Endpoint.Rooms.Tasks
  alias Endpoint.Rooms.Tasks.Task

  test """
  * post tasks
  * get tasks
  * get task
  """ do
    access_token = System.get_env("CHATWORK_TOKEN")
    # get myroom
    %{
      body: %{
        account_id: my_id,
        room_id: room_id
      }
    } = Me.get!(access_token)

    %{
      body: %{task_ids: task_ids}
    } = Tasks.post!(access_token, room_id, "integartion task", my_id)

    task_id = hd(task_ids)

    %{
      body: _
    } = Tasks.get!(access_token, room_id)

    %{
      body: _
    } = Task.get!(access_token, room_id, task_id)
  end
end
