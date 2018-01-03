defmodule ChatworkEx.Response.RateLimit do
  defstruct [
    :limit,
    :remaining,
    :reset,
  ]

  @type t :: %__MODULE__{
    limit: integer,
    remaining: integer,
    reset: integer,
  }
end
