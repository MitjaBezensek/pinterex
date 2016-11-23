defmodule Pinterex.Api.Base do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api.pinterest.com/v1/"
  plug Tesla.Middleware.Query, [access_token: key]
  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.DebugLogger

  def key do
    Application.get_env(:pinterest, :key) ||
      System.get_env("PINTEREST_KEY")
  end

  def execute_request(:get, path) do
    get(path).body["data"]
  end

  def execute_request(:get, path, []) do
    execute_request(:get, path)
  end

  def execute_request(:get, path, options) do
    fields = "?fields=" <> Enum.join(options, ",")
    execute_request(:get, path <> fields)
  end
end
