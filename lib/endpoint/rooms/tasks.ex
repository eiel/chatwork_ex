defmodule ChatworkEx.Endpoint.Rooms.Tasks do
  alias ChatworkEx.Endpoint.Base
  alias ChatworkEx.Response
  alias ChatworkEx.Response.Task
  alias ChatworkEx.Response.TaskIds
  alias ChatworkEx.ParameterNormalizer

  @path "rooms/"
  @url Base.base() <> @path

  def url(room_id), do: @url <> to_string(room_id) <> "/tasks"

  @spec get!(
          bitstring,
          pos_integer,
          account_id: pos_integer,
          assigned_by_account: pos_integer,
          status: Task.status()
        ) :: Response.t([Task.t()])
  def get!(access_token, room_id, options \\ []) do
    Base.get!(url(room_id), access_token, options)
    |> Base.to_response!([%Task{}])
  end

  @spec post!(bitstring, pos_integer, bitstring, pos_integer | [pos_integer], limit: pos_integer) ::
          Response.t(TaskIds.t())
  def post!(access_token, room_id, body, to_ids, options \\ []) do
    params = [{:body, body} | [{:to_ids, to_ids} | options]]
    params = ParameterNormalizer.normalize(params)

    Base.post!(url(room_id), access_token, params)
    |> Base.to_response!(%TaskIds{})
  end
end
