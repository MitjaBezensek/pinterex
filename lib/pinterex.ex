defmodule Pinterex do
  use Application

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

  defdelegate execute_request(method, path), to: Pinterex.Api.Base
  defdelegate execute_request(method, path, options), to: Pinterex.Api.Base

  defdelegate me(options \\ []), to: Pinterex.Api.User

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
