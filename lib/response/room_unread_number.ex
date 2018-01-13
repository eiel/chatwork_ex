defmodule ChatworkEx.Response.RoomUnreadNumber do
  defstruct [
    :unread_num,
    :mention_num
  ]

  @type t :: [
          unread_num: non_neg_integer,
          mention_num: non_neg_integer
        ]
end
