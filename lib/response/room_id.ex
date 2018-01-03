defmodule ChatworkEx.Response.RoomId do
  defstruct [
    :room_id
  ]

  @type t :: %__MODULE__{
    room_id: integer
  }
end
