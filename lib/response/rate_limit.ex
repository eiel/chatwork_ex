defmodule ChatworkEx.Response.RateLimit do
  defstruct [
    :limit,
    :remaining,
    :reset,
  ]

  @type t :: %__MODULE__{
    limit: non_neg_integer,
    remaining: non_neg_integer,
    reset: pos_integer,
  }
end
