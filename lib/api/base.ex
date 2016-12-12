defmodule Pinterex.Api.Base do
  @moduledoc """
  The module contains all the logic that does the actual calls to
  the Pinterest API
  """
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api.pinterest.com/v1/"
  plug Tesla.Middleware.Query, [access_token: key]
  plug Tesla.Middleware.JSON
  #plug Tesla.Middleware.DebugLogger

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
  def execute_request(:get, create_struct, path) do
    get(path)
    |> handle_response(create_struct)
  end

  @doc """
  This is the main function that does post requests.

  ## Parameters

  - :post: it only matches post requests
  - path: the path of the resource, this path should already contain
  all the query field and everything
  - data: the data to post. Example: %{board: "username/board_name"}
  """
  def execute_request(:post, path, data) do
    post(path, data)
    |> handle_response
  end

  @doc """
  This is the main function that does delete requests.

  ## Parameters

  - :delete: it only matches delete requests
  - path: the path of the resource, this path should already contain
  all the query field and everything
  """
  def execute_request(:delete, path) do
    delete(path)
    |> handle_response
  end

  def execute_request(:get, createStruct, path, []) do
    execute_request(:get, createStruct, path)
  end

  @doc """
  The function is used for doing get requests that have additional parameters.

  ## Parameters

  - :get: it only matches get requests
  - createStruct: if the response succeeds this is the function that will be used to created the structs from the data that was received
  - path: the path of the resource, this path should already contain
  all the query field and everything
  - options: a list of options that should be added to the request. For example
  we might wish to get bio and counts for a certain user. In this case we would
  pass in ["bio", "counts"].

  ## Returns

  The data of the returned response. If the response is not successful it
  crashes since it cannot parse the response correctly.
  """
  def execute_request(:get, createStruct, path, options) do
    case List.keyfind(options, :next, 0) do
      {:next, url} -> execute_request(:get, createStruct, url)
      _ -> execute_request(:get, createStruct, path <> get_fields(path, options))
    end
  end

  @doc """
  This is the main function that does patch requests.

  ## Parameters

  - :patch: it only matches patch requests
  - path: the path of the resource, this path should already contain
  all the query field and everything
  - data: the data to . Example: %{name: "New Name"}
  """
  def execute_request(:patch, create_struct, path, data) do
    patch(path, data)
    |> handle_response(create_struct)
  end

  defp get_fields(path, options) do
    start =
      if(String.contains? path, "?") do
        "&"
      else
        "?"
      end
    start <> Enum.join(Enum.map(options, &concat_items/1), "&")
  end

  defp concat_items({k, v}) when is_list(v) do
    "#{k}=" <> Enum.join(v, ",")
  end

  defp concat_items({k, v}) do
    "#{k}=#{v}"
  end

  defp handle_response(response, createStruct) do
    case response.status do
      200 -> {:ok, createStruct.(response.body)}
      _ -> {:error, response.body["message"]}
    end
  end

  defp handle_response(response) do
    case response.status do
      200 -> {:ok, response.body["data"]}
      _ -> {:error, response.body["message"]}
    end
  end
end
