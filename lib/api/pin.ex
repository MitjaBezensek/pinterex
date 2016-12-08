defmodule Pinterex.Api.Pin do
  @moduledoc """
  This moducle handles the Pin specific API calls.
  """
  
  alias Pinterex.Helpers.Helpers

  def getPin(id) do
    Pinterex.execute_request(:get, "/pins/#{id}")
    |> Helpers.createPin
  end

  def deletePin(pin) do
    Pinterex.execute_request(:delete, "/pins/#{pin}/")
  end
end
