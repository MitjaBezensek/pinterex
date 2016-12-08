defmodule Pinterex.Helpers.Helpers do
  @moduledoc """
  Various helpers for creating the structs from the fetched data.
  """
  
  alias Pinterex.Structs.{User, Board, Pin, Interest}

  def createBoard(board) do
    Board.new(board)
  end

  def createBoards(boards) do
    boards
    |> Enum.map(fn board -> createBoard(board) end)
  end

  def createPin(pin) do
    Pin.new(pin)
  end

  def createPins(pins) do
    pins
    |> Enum.map(fn pin -> createPin(pin) end)
  end

  def createUser(user) do
    User.new(user)
  end

  def createUsers(users) do
    users
    |> Enum.map(fn user -> createUser(user) end)
  end

  def createInterest(interest) do
    Interest.new(interest)
  end

  def createInterests(interests) do
    interests
    |> Enum.map(fn interest -> createInterest(interest) end)
  end
end
