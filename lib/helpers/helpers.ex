defmodule Pinterex.Helpers.Helpers do
  @moduledoc """
  Various helpers for creating the structs from the fetched data.
  """

  alias Pinterex.Structs.{User, Board, Pin, Interest, PagedBoards, PagedPins, PagedUsers, PinCounts, BoardCounts, UserCounts}

  def create_board(response) do
    create_single_board(response["data"])
  end

  def create_single_board(board) do
    Board.new(board)
    |> add_board_field(:creator)
    |> add_board_field(:counts)
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
    |> add_pin_field(:creator)
    |> add_pin_field(:counts)
  end

  def create_pins(response) do
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
    |> add_user_field(:counts)
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

  def add_pin_field(pin, :creator) do
    if pin.creator do
      %Pin{pin | creator: create_single_user(pin.creator)}
    else
      pin
    end
  end

  def add_pin_field(pin, :counts) do
    if pin.counts do
      %Pin{pin | counts: create_pin_counts(pin.counts)}
    else
      pin
    end
  end

  def add_board_field(board, :creator) do
    if board.creator do
      %Board{board | creator: create_single_user(board.creator)}
    else
      board
    end
  end

  def add_board_field(board, :counts) do
    if board.counts do
      %Board{board | counts: create_board_counts(board.counts)}
    else
      board
    end
  end

  def add_user_field(user, :counts) do
    if user.counts do
      %User{user | counts: create_user_counts(user.counts)}
    else
      user
    end
  end

  defp create_pin_counts(counts), do: PinCounts.new(counts)

  defp create_board_counts(counts), do: BoardCounts.new(counts)

  defp create_user_counts(counts), do: UserCounts.new(counts)
end
