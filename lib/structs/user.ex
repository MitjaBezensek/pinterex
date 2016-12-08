defmodule Pinterex.Structs.User do
  @moduledoc """
  User struct.

  ## Reference

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)
  """

  defstruct id: nil, username: nil, first_name: nil, last_name: nil, bio: nil,
  created_at: nil, counts: nil, image: nil

  use ExConstructor
end
