defmodule Pinterex.Api.Pin do
  alias Pinterex.Helpers.Helpers

  def getPin(id) do
    Pinterex.request2(:get, "/pins/#{id}")
    |> Helpers.createPin
  end
end
