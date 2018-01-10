defmodule ChatworkEx do
  @moduledoc """
  ChatWork API Interface
  """

  def version do
    Mix.Project.config()[:version]
  end
end
