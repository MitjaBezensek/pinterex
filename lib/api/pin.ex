defmodule Pinterex.Api.Pin do
  @moduledoc """
  This module handles the Pin specific API calls.
  """

  alias Pinterex.Helpers.Helpers

  def get_pin(id, options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_pin/1, "/pins/#{id}", options)
  end

  def delete_pin(pin) do
    Pinterex.execute_request(:delete, "/pins/#{pin}/")
  end
end
