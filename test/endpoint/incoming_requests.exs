defmodule ChatworkEx.Endpoint.IncomingRequestsTest do
  use ExUnit.Case

  import ChatworkEx.Endpoint.IncomingRequests

  test "get!" do
    access_token = System.get_env("CHATWORK_TOKEN")

    %{
      rate_limit: _,
      body: _
    } = get!(access_token)
  end
end
