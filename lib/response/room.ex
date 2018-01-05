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

  @type icon_preset :: :group | :check | :document | :meeting | :event | :project | :business | :study | :security | :star | :idea | :heart | :magcup | :beer | :music | :sports | :travel

  @type t :: %__MODULE__{
    room_id: pos_integer,
    name: bitstring,
    type: bitstring, # "group" | "my" | "direct"
    role: bitstring, # "admin" | "member" | "readonly"
    sticky: boolean,
    unread_num: non_neg_integer,
    mention_num: non_neg_integer,
    mytask_num: non_neg_integer,
    message_num: non_neg_integer,
    file_num: non_neg_integer,
    task_num: non_neg_integer,
    icon_path: bitstring,
    last_update_time: pos_integer, # Unixtime
  }
end
