defmodule ChatworkEx.Response.MyStatus do
  defstruct [
    :unread_room_num,
    :mention_room_num,
    :mytask_room_num,
    :unread_num,
    :mention_num,
    :mytask_num,
  ]
end
