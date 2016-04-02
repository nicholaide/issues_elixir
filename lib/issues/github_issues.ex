#---
# Excerpted from "Programming Elixir",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/elixir for more book information.
#---
defmodule Issues.GithubIssues do
  @user_agent  [ {"User-agent", "Elixir nicholaide@github"} ]

  def fetch(user, project) do
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end
  def issues_url(user, project) do
    "https://api.github.com/repos/#{user}/#{project}/issues"
  end
  def handle_response({:ok, %{status_code: 200, body: body}}) do
    { :ok, :jsx.decode(body) }
  def handle_response(%{status_code: ___, body: body}) do
    { :error, :jsx.decode(body) }
end