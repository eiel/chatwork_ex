defmodule ChatworkEx.Endpoint.Rooms do
  @moduledoc """
  Rooms Endopoint API Intefaces.
  """

  alias ChatworkEx.Endpoint.Base
  alias ChatworkEx.Response.{Room, RoomId}
  alias ChatworkEx.{Response, UnauthorizedError}

  @path "rooms"
  @url Base.base() <> @path

  def path, do: @path
  def url, do: @url

  @spec get!(bitstring) :: Response.t([Room.t()])
  def get!(access_token) do
    Base.get!(url(), access_token)
    |> to_response!
  end

  def get(access_token) do
    try do
      response = get!(access_token)
      {:ok, response}
    rescue
      e in UnauthorizedError ->
        {:error, e}
    end
  end

  @doc """
  http://developer.chatwork.com/ja/endpoint_rooms.html#POST-rooms

  ## options

  * `description`
  * `icon_preset`
  * `members_member_ids`
  * `members_readonly_ids`
  """
  @type post_options :: [
          description: bitstring,
          icon_preset: Room.icon_preset(),
          members_member_ids: pos_integer | [pos_integer],
          members_readonly_ids: pos_integer | [pos_integer]
        ]
  @spec post!(bitstring, bitstring, pos_integer | [pos_integer], post_options) ::
          Respons.t(RoomId.t())
  def post!(access_token, name, members_admin_ids, options \\ []) do
    options = [
      {:name, name}
      | [
          {:members_admin_ids, members_admin_ids}
          | options
        ]
    ]

    Base.post!(url(), access_token, options)
    |> to_room_id_response!
  end

  defp to_response!(response) do
    Base.to_response!(response, [%Room{}])
  end

  defp to_room_id_response!(response) do
    Base.to_response!(response, %RoomId{})
  end
end
