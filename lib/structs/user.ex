defmodule Pinterex.Structs.User do
  defstruct id: nil, username: nil, first_name: nil, last_name: nil, bio: nil,
  created_at: nil, counts: nil, image: nil

  use ExConstructor
end
