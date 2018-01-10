defprotocol ChatworkEx.HeaderCreator do
  @spec headers(any) :: Keyword.t()
  def headers(access_token)
end

defimpl ChatworkEx.HeaderCreator, for: BitString do
  @spec headers(bitstring) :: Keyword.t()
  def headers(access_token) do
    [
      "X-ChatWorkToken": access_token
    ]
  end
end
