defmodule ChatworkEx.Response.Message do
  ChatworkEx.Response.Account

  defstruct [
    :message_id,
    :account,
    :body,
    :send_time,
    :update_time
  ]

  @type t :: %__MODULE__{
          message_id: bitstring,
          account: Account.t(),
          body: bitstring,
          send_time: pos_integer,
          update_time: non_neg_integer
        }
end
