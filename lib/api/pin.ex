defmodule Pinterex.Api.Pin do
  alias Pinterex.Helpers.Helpers

  def getPin(id) do
    Pinterex.execute_request(:get, "/pins/#{id}")
    |> Helpers.createPin
  end
end
