defmodule ChatworkEx.Response.Account do
  defstruct [
    :account_id,
    :name,
    :avatar_image_url
  ]

  @type t :: %__MODULE__{
          account_id: pos_integer,
          name: bitstring,
          avatar_image_url: bitstring
        }
end
