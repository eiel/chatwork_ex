defmodule ChatworkEx.Response do

  defstruct [
    :rate_limit,
    :body,
  ]

  @type t(body) :: %__MODULE__{
    rate_limit: RateLimit.t,
    body: body
  }
end
