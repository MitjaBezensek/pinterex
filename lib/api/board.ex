defmodule Pinterex.Api.Board do
  alias Pinterex.Helpers.Helpers

  def getBoardPins(board) do
    Pinterex.execute_request(:get, "/boards/#{board}/pins/")
    |> Helpers.createPins
  end

  def getBoard(board) do
    Pinterex.execute_request(:get, "boards/#{board}")
    |> Helpers.createBoard
  end
end
