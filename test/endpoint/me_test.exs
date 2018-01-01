defmodule ChatworkEx.Endpoint.MeTest do
  use ExUnit.Case
  doctest ChatworkEx.Endpoint.Me

  import ChatworkEx.Endpoint.Me
  alias ChatworkEx.Response
  alias ChatworkEx.Response.RateLimit
  alias ChatworkEx.Response.Me
  alias ChatworkEx.UnauthorizedError

  test "url" do
    assert url() == "https://api.chatwork.com/v2/me"
  end

  test "get!" do
    access_token = System.get_env("CHATWORK_TOKEN")
    %Response{
      rate_limit: %RateLimit{
        limit: _,
        remaining: _,
        reset: _,
      },
      body: %Me{
        account_id: _
      },
    } = get!(access_token)
  end

  test "get! in invalid_token" do
    assert_raise UnauthorizedError, fn ->
      get!("")
    end
  end

  test "get in invalid_token" do
    {:error, %UnauthorizedError{message: _}} = get("")
  end
end
