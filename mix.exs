defmodule Pinterex.Mixfile do
  use Mix.Project

  def project do
    [app: :pinterex,
     version: "0.2.2",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger],
     mod: {Pinterex, []}] 
  end

  def description do
    """
    A simple Elixir wrapper for Pinterest API.
    """
  end

  def package do
    [
      maintainers: ["Mitja Bezenšek"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/MitjaBezensek/pinterex" }
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:tesla, "~> 0.5.0"},
     {:poison, ">= 1.0.0"},
     {:exconstructor, "~> 1.0.2"},
     {:ex_doc, ">= 0.0.0"}]
  end
end
