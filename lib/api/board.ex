defmodule Pinterex.Api.Board do
  @moduledoc """
  This module handles the Boards specific API calls.
  """
  alias Pinterex.Helpers.Helpers

  def get_board_pins(board, options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_pins/1, "/boards/#{board}/pins/", options)
  end

  def get_board(board, options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_board/1, "/boards/#{board}", options)
  end

  def create_board(name, nil) do
    Pinterex.execute_request(:post, &Helpers.create_board/1, "/boards/", %{name: name})
  end

  def create_board(name, description) do
    Pinterex.execute_request(:post, &Helpers.create_board/1, "/boards/", %{name: name, description: description})
  end

  def delete_board(board) do
    Pinterex.execute_request(:delete, "/boards/#{board}/")
    |> Helpers.create_board
  end

  def edit_board(board, [name: name, description: description]) do
    Pinterex.execute_request(:patch, &Helpers.create_board/1, "/boards/#{board}/", %{name: name, description: description})
  end

  def edit_board(board, [name: name]) do
    Pinterex.execute_request(:patch, &Helpers.create_board/1, "/boards/#{board}/", %{name: name})
  end

  def edit_board(board, [description: description]) do
    Pinterex.execute_request(:patch, &Helpers.create_board/1, "/boards/#{board}/", %{description: description})
  end

end
