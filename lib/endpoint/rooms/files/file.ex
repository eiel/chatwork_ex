defmodule ChatworkEx.Endpoint.Rooms.Files.File do
  alias ChatworkEx.Endpoint.Base
  alias ChatworkEx.Response.File
  alias ChatworkEx.ParameterBool

  def url(room_id, file_id),
    do: Base.base() <> "rooms/" <> to_string(room_id) <> "/files/" <> to_string(file_id)

  @spec get!(bitstring, pos_integer, pos_integer, create_download_url: boolean) ::
          Response.t([File.t()])
  def get!(access_token, room_id, file_id, options \\ []) do
    options = ParameterBool.to_string(options, :create_download_url)

    Base.get!(url(room_id, file_id), access_token, options)
    |> Base.to_response!([%File{}])
  end
end
