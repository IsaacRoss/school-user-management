defmodule UM.MixProject do
  use Mix.Project

  def project do
    [
      app: :user_management,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {UM.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:postgrex, "~> 0.13.5"},
      {:ecto, "~> 2.2"},
      {:phoenix_pubsub, "~> 1.0"}
    ]
  end
end
