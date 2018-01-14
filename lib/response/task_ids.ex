defmodule ChatworkEx.Response.TaskIds do
  defstruct [:task_ids]

  @type t :: %__MODULE__{
          task_ids: [pos_integer]
        }
end
