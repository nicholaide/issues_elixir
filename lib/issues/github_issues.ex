#---
# Excerpted from "Programming Elixir",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/elixir for more book information.
#---
defmodule Issues.GithubIssues do
  
  require Logger
  
  @user_agent  [ {"User-agent", "Elixir nicholaide@github"} ]
  @github_url Application.get_env(:issues, :github_url)

  def fetch(user, project) do
    Logger.info "Fetching user #{user}'s project #{project}"
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end
  
  def issues_url(user, project) do
    #"https://api.github.com/repos/#{user}/#{project}/issues"
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end
  
  def handle_response({:ok, %{status_code: 200, body: body}}) do
    Logger.info "Successful response"
    Logger.debug fn -> inspect(body) end
    { :ok, :jsx.decode(body) }
  end
  
  def handle_response(%{status_code: status, body: body}) do
    Logger.error "Error #{status} returned"
    { :error, :jsx.decode(body) }
  end
  
end