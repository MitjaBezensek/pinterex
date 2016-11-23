defmodule Pinterex.Api.Base do
  @moduledoc """
  The module contains all the logic that does the actual calls to
  the Pinterest API
  """
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api.pinterest.com/v1/"
  plug Tesla.Middleware.Query, [access_token: key]
  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.DebugLogger

  defp key do
    Application.get_env(:pinterest, :key) ||
      System.get_env("PINTEREST_KEY")
  end

  @doc """
  This is the main function that does get requests.
  ## Parameters
  - :get: it only matches get requests
  - path: the path of the resource, this path should already contain
  all the query field and everything

  ## Returns
  The data of the returned response. If the response is not successful it
  crashes since it cannot parse the response correctly.
  """
  def execute_request(:get, path) do
    get(path).body["data"]
  end

  def execute_request(:get, path, []) do
    execute_request(:get, path)
  end

  @doc """
  The function is used for doing get requests that have additional parameters.
  ## Parameters
  - :get: it only matches get requests
  - path: the path of the resource, this path should already contain
  all the query field and everything
  - options: a list of options that should be added to the request. For example
  we might wish to get bio and counts for a certain user. In this case we would
  pass in ["bio", "counts"].

  ## Returns
  The data of the returned response. If the response is not successful it
  crashes since it cannot parse the response correctly.
  """
  def execute_request(:get, path, options) do
    fields = "?fields=" <> Enum.join(options, ",")
    execute_request(:get, path <> fields)
  end
end