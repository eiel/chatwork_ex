defmodule ChatworkEx.Response.Request do
  defstruct [
    :request_id,
    :account_id,
    :message,
    :name,
    :chatwork_id,
    :organization_id,
    :organization_name,
    :department,
    :avatar_image_url
  ]

  @type t :: %__MODULE__{
          request_id: pos_integer,
          account_id: pos_integer,
          message: bitstring,
          name: bitstring,
          chatwork_id: bitstring,
          organization_id: bitstring,
          organization_name: bitstring,
          department: bitstring,
          avatar_image_url: bitstring
        }
end
