defmodule ChatworkEx.ParameterNormalizer do
  @doc """
  iex> normalize([])
  []

  iex> normalize([key: 1])
  [key: 1]

  iex> normalize([key: [1]])
  [key: 1]

  iex> normalize(
  ...>   [key: [1,2], key: [3]]
  ...> )
  [key: 1, key: 2, key: 3]

  """
  @spec normalize(Keyword.t) :: Keyword.t
  def normalize(params) do
    List.foldr(params, [], fn (elem, acc) ->
      case elem do
        {key, xs} when is_list(xs) ->
          List.foldr(xs, acc, fn (elem, acc) -> [{key, elem} | acc] end)
        x -> [x | acc]
      end
    end)
  end
end
