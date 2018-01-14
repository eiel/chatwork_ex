defmodule ChatworkEx.Endpoint.IncomingRequests.IncommingRequestTest do
  use ExUnit.Case

  import ChatworkEx.Endpoint.IncomingRequests.IncommingRequest
  alias ChatworkEx.Errors.NotFoundError

  test "put!" do
    access_token = System.get_env("CHATWORK_TOKEN")

    request_id = 1

    assert_raise(NotFoundError, fn ->
      delete!(access_token, request_id)
    end)
  end

  test "delete!" do
    access_token = System.get_env("CHATWORK_TOKEN")

    request_id = 1

    assert_raise(NotFoundError, fn ->
      delete!(access_token, request_id)
    end)
  end
end
