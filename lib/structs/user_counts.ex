defmodule Pinterex.Structs.UserCounts do
  @moduledoc false

  defstruct boards: nil, followers: nil, following: nil, likes: nil, pins: nil

  use ExConstructor
end
