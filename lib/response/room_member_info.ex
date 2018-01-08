defmodule ChatworkEx.Response.RoomMemberInfo do
  defstruct [
    :admin,
    :member,
    :readonly,
  ]

  @type t :: [
    admin: [pos_integer],
    member: [pos_integer],
    readonly: [pos_integer],
  ]
end
