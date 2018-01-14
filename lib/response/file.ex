defmodule ChatworkEx.Response.File do
  alias ChatworkEx.Response.Account

  defstruct [
    :file_id,
    {:account, %Account{}},
    :message_id,
    :filename,
    :filesize,
    :upload_time
  ]

  @type t :: %__MODULE__{
          file_id: pos_integer,
          account: Account.t(),
          message_id: pos_integer,
          filename: bitstring,
          filesize: pos_integer,
          upload_time: pos_integer
        }
end
