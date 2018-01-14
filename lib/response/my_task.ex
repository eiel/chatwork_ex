defmodule ChatworkEx.Response.MyTask do
  defstruct [
    :task_id,
    {:room, %ChatworkEx.Response.RoomSummary{}},
    :assigned_by_account,
    :message_id,
    :body,
    :limit_time,
    :status
  ]

  @type t :: %__MODULE__{
          task_id: integer,
          room: RoomSummary.t(),
          assigned_by_account: integer,
          message_id: bitstring,
          body: bitstring,
          status: ChatworkEx.Response.Task.status()
        }
end
