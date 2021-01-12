defmodule ChatworkEx.Mixfile do
  use Mix.Project

  def project do
    [
      app: :chatwork_ex,
      version: "0.0.1",
      elixir: "~> 1.5",
      description: "ChatWork API Interface for Elixir",
      package: [
        contributors: ["Tomohiko Himura"],
        maintainers: ["Tomohiko Himura"],
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/eiel/chatwork_ex"}
      ],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:httpoison],
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:poison, "~> 3.1"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
