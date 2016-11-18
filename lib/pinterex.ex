defmodule Pinterex do
  use Application
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api.pinterest.com/v1/"
  plug Tesla.Middleware.Query, [access_token: key]
  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.DebugLogger

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: Pinterex.Worker.start_link(arg1, arg2, arg3)
      # worker(Pinterex.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pinterex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def key do
    Application.get_env(:pinterest, :key) ||
    System.get_env("PINTEREST_KEY")
  end

  def request2(:get, path) do
    get(path).body["data"]
  end

  defdelegate me, to: Pinterex.Api.User

  defdelegate myBoards, to: Pinterex.Api.User

  defdelegate mySuggestedBoards(id), to: Pinterex.Api.User

  defdelegate myLikes, to: Pinterex.Api.User

  defdelegate myPins, to: Pinterex.Api.User

  defdelegate searchMyBoards(query), to: Pinterex.Api.User

  defdelegate searchMyPins(query), to: Pinterex.Api.User

  defdelegate myFollowers, to: Pinterex.Api.User

  defdelegate myFollowingBoards, to: Pinterex.Api.User

  defdelegate myFollowingInterests, to: Pinterex.Api.User

  defdelegate myFollowingUsers, to: Pinterex.Api.User

  defdelegate getPin(id), to: Pinterex.Api.Pin

  defdelegate getBoardPins(board), to: Pinterex.Api.Board
  
  defdelegate getBoard(board), to: Pinterex.Api.Board
end
