defmodule ChatworkEx.Response.Contact do
  defstruct [
    :account_id,
    :room_id,
    :name,
    :chatwork_id,
    :organization_id,
    :organization_name,
    :department,
    :avatar_image_url,
  ]

  @type t :: %__MODULE__{
    account_id: integer,
    room_id: integer,
    name: bitstring,
    chatwork_id: bitstring,
    organization_id: integer,
    organization_name: bitstring,
    department: bitstring,
    avatar_image_url: bitstring,
  }
end
