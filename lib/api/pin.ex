defmodule Pinterex.Api.Pin do
  @moduledoc """
  This moducle handles the Pin specific API calls.
  """

  alias Pinterex.Helpers.Helpers

  def getPin(id, options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_pin/1, "/pins/#{id}", options)
  end

  def deletePin(pin) do
    Pinterex.execute_request(:delete, "/pins/#{pin}/")
  end
end
