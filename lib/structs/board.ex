defmodule Pinterex.Structs.Board do
  defstruct id: nil, name: nil, url: nil, description: nil, creator: nil,
  created_at: nil, counts: nil, image: nil

  use ExConstructor
end
