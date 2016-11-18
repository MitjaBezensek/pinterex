defmodule Pinterex.Structs.Pin do
  defstruct id: nil, link: nil, url: nil, creator: nil, board: nil,
  created_at: nil, note: nil, color: nil, counts: nil, media: nil,
  attribution: nil, image: nil, metadata: nil

  use ExConstructor
end
