defmodule ChatworkEx.Response.Member do
  defstruct [
    :account_id,
    :role,
    :name,
    :chatwork_id,
    :organization_id,
    :organization_name,
    :department,
    :avatar_image_url
  ]

  @type role :: :admin | :member | :readonly
  @type t :: %__MODULE__{
          account_id: pos_integer,
          role: role,
          name: bitstring,
          chatwork_id: bitstring,
          organization_id: pos_integer,
          organization_name: bitstring,
          department: bitstring,
          avatar_image_url: bitstring
        }
end
