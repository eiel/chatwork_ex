defmodule ChatworkEx.Response.Room do
  defstruct [
    :room_id,
    :name,
    :type,
    :role,
    :sticky,
    :unread_num,
    :mention_num,
    :mytask_num,
    :message_num,
    :file_num,
    :task_num,
    :icon_path,
    :last_update_time,
  ]

  @type t :: %__MODULE__{
    room_id: integer,
    name: bitstring,
    type: bitstring, # "group" | "my" | "direct"
    role: bitstring, # "admin" | "member" | "readonly"
    sticky: boolean,
    unread_num: integer,
    mention_num: integer,
    mytask_num: integer,
    message_num: integer,
    file_num: integer,
    task_num: integer,
    icon_path: bitstring,
    last_update_time: integer, # Unixtime
  }
end
