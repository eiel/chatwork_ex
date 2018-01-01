defmodule ChatworkEx.Response.RateLimit do
  defstruct [
    :limit,
    :remaining,
    :reset,
  ]
end
