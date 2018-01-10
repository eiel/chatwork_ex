defmodule ChatworkEx.Response.RoomSummary do
  defstruct [
    :icon_path,
    :name,
    :room_id
  ]

  @type t :: %__MODULE__{
          icon_path: bitstring,
          name: bitstring,
          room_id: pos_integer
        }
end
