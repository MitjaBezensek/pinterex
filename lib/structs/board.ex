defmodule Pinterex.Structs.Board do
  @moduledoc """
  Board struct.

  ## Reference

  [https://developers.pinterest.com/docs/api/boards/](https://developers.pinterest.com/docs/api/boards/)
  """

  defstruct id: nil, name: nil, url: nil, description: nil, creator: nil,
  created_at: nil, counts: nil, image: nil

  use ExConstructor
end
