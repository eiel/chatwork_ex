defmodule ChatworkEx.Errors do
  defmodule UnauthorizedError do
    defexception message: ""
  end

  defmodule BadClientError do
    defexception message: ""
  end
end
