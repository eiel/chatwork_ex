defmodule ChatworkEx.Response.Task do
  alias ChatworkEx.Response.Account

  defstruct [
    :task_id,
    {:account, %Account{}},
    {:assigned_by_account, %Account{}},
    :message_id,
    :body,
    :limit_time,
    :status
  ]

  @type status :: :done | :open
  @type t :: %__MODULE__{
          task_id: integer,
          account: Account.t(),
          assigned_by_account: Account.t(),
          message_id: bitstring,
          body: bitstring,
          status: status()
        }
end
