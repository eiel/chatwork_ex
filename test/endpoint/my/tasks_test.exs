defmodule ChatworkEx.Endpoint.My.TasksTest do
  use ExUnit.Case

  import ChatworkEx.Endpoint.My.Tasks

  alias ChatworkEx.Response
  alias ChatworkEx.Response.Task
  alias ChatworkEx.Response.RoomSummary
  alias ChatworkEx.Response.RateLimit

  doctest ChatworkEx.Endpoint.My.Tasks

  test "get!" do
    access_token = System.get_env("CHATWORK_TOKEN")
    %Response{
      rate_limit: %RateLimit{
        limit: _,
        remaining: _,
        reset: _,
      },
      body: body
    } = get!(access_token)
    %Task{
      task_id: _,
      room: room,
    } = hd(body)
    %RoomSummary{ room_id: _ } = room
  end

  test "get! status: done" do
    access_token = System.get_env("CHATWORK_TOKEN")
    %Response{
      rate_limit: %RateLimit{
        limit: _,
        remaining: _,
        reset: _,
      },
      body: body
    } = get!(access_token, status: "done")
    %Task{
      task_id: _,
    } = hd(body)
  end


end
