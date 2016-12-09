defmodule Pinterex.Api.Board do
  @moduledoc """
  This module handles the Boards specific API calls.
  """
  alias Pinterex.Helpers.Helpers

  def getBoardPins(board, options \\ []) do
    Pinterex.execute_request(:get, &Helpers.createPins/1, "/boards/#{board}/pins/", options)
  end

  def getBoard(board, options \\ []) do
    Pinterex.execute_request(:get, &Helpers.createBoard/1, "/boards/#{board}", options)
  end

  def createBoard(name, nil) do
    Pinterex.execute_request(:post, &Helpers.createBoard/1, "/boards/", %{name: name})
  end

  def createBoard(name, description) do
    Pinterex.execute_request(:post, &Helpers.createBoard/1, "/boards/", %{name: name, description: description})
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
