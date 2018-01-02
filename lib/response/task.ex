defmodule ChatworkEx.Response.Task do
  defstruct [
    :task_id,
    { :room, %ChatworkEx.Response.RoomSummary{} },
    :assigned_by_account,
    :message_id,
    :body,
    :limit_time,
    :status_open,
  ]
end
