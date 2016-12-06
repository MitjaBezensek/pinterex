defmodule Pinterex.Api.Board do
  alias Pinterex.Helpers.Helpers

  def getBoardPins(board) do
    Pinterex.execute_request(:get, "/boards/#{board}/pins/")
    |> Helpers.createPins
  end

  def getBoard(board) do
    Pinterex.execute_request(:get, "/boards/#{board}")
    |> Helpers.createBoard
  end

  def createBoard(name, nil) do
    Pinterex.execute_request(:post, "/boards/", %{name: name})
    |> Helpers.createBoard
  end

  def createBoard(name, description) do
    Pinterex.execute_request(:post, "/boards/", %{name: name, description: description})
    |> Helpers.createBoard
  end

  def deleteBoard(board) do
    Pinterex.execute_request(:delete, "/boards/#{board}/")
    |> Helpers.createBoard
  end

  def editBoard(board, name, nil) do
    Pinterex.execute_request(:patch, "/boards/#{board}/", %{name: name})
    |> Helpers.createBoard
  end

  def editBoard(board, nil, description) do
    Pinterex.execute_request(:patch, "/boards/#{board}/", %{description: description})
    |> Helpers.createBoard
  end

  def editBoard(board, name, description) do
    Pinterex.execute_request(:patch, "/boards/#{board}/", %{name: name, description: description})
    |> Helpers.createBoard
  end
end
