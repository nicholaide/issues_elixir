defmodule Issues.Mixfile do
  use Mix.Project

  def project do
    [app: :issues,
     version: "0.0.1",
     name: "Issues",
     source_url: "https://github.com/nicholaide/issues_elixir",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     escript: escript_config,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison] ] #i didn't seem to need to include :jsx here
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
    [
      { :httpoison, "~> 0.4"}, #this is found in Hex, which is the package manager for Elixir
      { :jsx, "~> 2.0"}, #JSON library
      { :ex_doc, github: "elixir-lang/ex_doc"},
      { :earmark, ">= 0.0.0"}
    ]
  end
  
  defp escript_config do
    [ main_module: Issues.CLI ]
  end
  
end
