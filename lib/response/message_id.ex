defmodule ChatworkEx.Response.MessageId do
  defstruct [
    :message_id
  ]

  @type t :: %__MODULE__{
          message_id: bitstring
        }
end
