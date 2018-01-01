defprotocol ChatworkEx.HeaderCreator do
  def headers(access_token)
end

defimpl ChatworkEx.HeaderCreator, for: BitString do
  def headers(access_token) do
    [
      "X-ChatWorkToken": access_token
    ]
  end
end
