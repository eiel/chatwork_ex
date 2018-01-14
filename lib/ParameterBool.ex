defmodule ChatworkEx.ParameterBool do
  @spec to_string(Keyword.t(), atom) :: Keyword.t()
  def to_string(params, key) do
    List.foldr(params, [], fn elem, acc ->
      case elem do
        {^key, true} ->
          [{key, "1"} | acc]

        {^key, _} ->
          [{key, "0"} | acc]

        _ ->
          acc
      end
    end)
  end
end
