defmodule Protocols.MixProject do
  use Mix.Project

  def project do
    [
      app: :protocols,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.1"},
      {:postgrex, "~> 0.14.3"},
      {:jason, "~> 1.1"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
