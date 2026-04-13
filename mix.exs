defmodule SuperBtrx.MixProject do
  use Mix.Project

  def project do
    [
      app: :super_btrx,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {SuperBtrx.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
    {:phoenix, "~> 1.7.14"},
    {:plug_cowboy, "~> 2.6"},
    {:req, "~> 0.5.0"},
    {:jiffy, "~> 1.0"},
    {:httpoison, "~> 2.0"},
    {:jason, "~> 1.4"}
    ]
  end
end
