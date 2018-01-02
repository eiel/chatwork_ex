defmodule ChatworkEx.Endpoint.My.StatusTest do
  use ExUnit.Case

  import ChatworkEx.Endpoint.My.Status

  alias ChatworkEx.Response
  alias ChatworkEx.Response.MyStatus
  alias ChatworkEx.Response.RateLimit

  doctest ChatworkEx.Endpoint.My.Status

  test "get!" do
  access_token = System.get_env("CHATWORK_TOKEN")
  %Response{
    rate_limit: %RateLimit{
      limit: _,
      remaining: _,
      reset: _,
    },
    body: %MyStatus{
      unread_num: _
    },
  } = get!(access_token)
end


end
