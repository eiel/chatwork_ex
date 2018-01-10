defmodule ChatworkEx.Response.MyStatus do
  defstruct [
    :unread_room_num,
    :mention_room_num,
    :mytask_room_num,
    :unread_num,
    :mention_num,
    :mytask_num
  ]

  @type t :: %__MODULE__{
          unread_room_num: non_neg_integer,
          mention_room_num: non_neg_integer,
          mytask_room_num: non_neg_integer,
          unread_num: non_neg_integer,
          mention_num: non_neg_integer,
          mytask_num: non_neg_integer
        }
end
