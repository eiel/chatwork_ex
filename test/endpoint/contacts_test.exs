defmodule ChatworkEx.Endpoint.ContactsTest do
  use ExUnit.Case

  import ChatworkEx.Endpoint.Contacts

  alias ChatworkEx.Response
  alias ChatworkEx.Response.Contact
  alias ChatworkEx.Response.RateLimit

  doctest ChatworkEx.Endpoint.Contacts

  test "url" do
    assert url() == "https://api.chatwork.com/v2/contacts"
  end

  test "get!" do
    access_token = System.get_env("CHATWORK_TOKEN")
    %Response{
      rate_limit: %RateLimit{
        limit: _,
        remaining: _,
        reset: _,
      },
      body: contacts
    } = get!(access_token)

    %Contact{
      account_id: _
    } = hd(contacts)
  end
end
