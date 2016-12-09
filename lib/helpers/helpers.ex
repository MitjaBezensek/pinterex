defmodule Pinterex.Helpers.Helpers do
  @moduledoc """
  Various helpers for creating the structs from the fetched data.
  """

  alias Pinterex.Structs.{User, Board, Pin, Interest, PagedBoards, PagedPins, PagedUsers}

  def create_board(response) do
    create_single_board(response["data"])
  end

  def create_single_board(board) do
    Board.new(board)
  end

  def create_boards(response) do
    boards =
      response["data"]
    |> Enum.map(fn board -> create_single_board(board) end)

    page = response["page"]

    %PagedBoards{cursor: page["cursor"], next: page["next"], boards: boards}
  end

  def create_pin(response) do
    create_single_pin(response["data"])
  end

  def create_single_pin(pin) do
    Pin.new(pin)
  end

  def create_pins(response) do
    IO.puts inspect(response["data"])
    pins =
      response["data"]
      |> Enum.map(fn pin -> create_single_pin(pin) end)

    page = response["page"]

    %PagedPins{cursor: page["cursor"], next: page["next"], pins: pins}
  end

  def create_user(response) do
    create_single_user(response["data"])
  end

  def create_single_user(user) do
    User.new(user)
  end

  def create_users(response) do
    users =
      response
      |> Enum.map(fn user -> create_single_user(user) end)

    page = response["page"]

    %PagedUsers{cursor: page["cursor"], next: page["next"], users: users}
  end

  def create_interest(interest) do
    Interest.new(interest)
  end

  def create_interests(interests) do
    interests
    |> Enum.map(fn interest -> create_interest(interest) end)
  end
end
