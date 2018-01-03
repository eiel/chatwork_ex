defmodule ChatworkEx.Endpoint.My.Tasks do
  @moduledoc """
  My Tasks Endopoint API Intefaces.
  """

  alias ChatworkEx.Endpoint.Base
  alias ChatworkEx.Response.{ Task, RateLimit, Error }
  alias ChatworkEx.{ Response, HeaderCreator, UnauthorizedError }

  @path "my/tasks"
  @url Base.base <> @path

  def path, do: @path
  def url, do: @url

  @doc """
  ## options

  * `status`
    Must be either `"opet"` or `"done"`
  * `assigned_by_account`
  """
  def get!(access_token, options \\ []) do
    # TODO status is open or done
    Base.get!(url, access_token, options)
    |> to_response!
  end

  def get(access_token, options \\ []) do
    try do
      response = get!(access_token, options)
      {:ok, response}
    rescue
      e in UnauthorizedError ->
        {:error, e}
    end
  end

  defp to_response!(response) do
    Base.to_response!(response, [%Task{}])
  end

end
