defmodule ChatworkEx.Response.MyStatus do
  defstruct [
    :unread_room_num,
    :mention_room_num,
    :mytask_room_num,
    :unread_num,
    :mention_num,
    :mytask_num,
  ]

  @type t :: %__MODULE__{
    unread_room_num: integer,
    mention_room_num: integer,
    mytask_room_num: integer,
    unread_num: integer,
    mention_num: integer,
    mytask_num: integer,
  }
end
