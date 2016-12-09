defmodule Pinterex do
  @moduledoc """
  This is the main module of the libray. Use it to access all of the available Pinterest API calls.
  """
  use Application

  @doc false
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = []

    opts = [strategy: :one_for_one, name: Pinterex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @doc false
  defdelegate execute_request(method, path), to: Pinterex.Api.Base
  @doc false
  defdelegate execute_request(method, createStruct, path), to: Pinterex.Api.Base
  @doc false
  defdelegate execute_request(method, createStruct, path, options), to: Pinterex.Api.Base

  @doc """
  Used for fetching the data of the authenticated User's profile.

  ## Reference

  By default the API returns first and last name, ID and URL of the authenticated User. Use `Pinterex.me/1` if you wish to get other fields.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)
  """
  defdelegate me, to: Pinterex.Api.User

  @doc """
  Used for fetching the data of the authenticated User's profile.

  ## Reference

  By default the API returns first and last name, ID and URL of the authenticated User.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)

  ## Parameters

  - options: if we wish to get other fields of the User we pass a list of fields to fetch. To see which fields are available look at `Pinterex.Structs.User`.

  ## Example
  `Pinterex.me([fields: ["bio", "counts"]])`
  """
  defdelegate me(options), to: Pinterex.Api.User

  @doc """
  Returns a list of the public Boards of the authenticated User.

  ## Reference

  By default the API returns their URLs, IDs and names. Use `Pinterex.my_boards/1` to get other fields.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)
  """
  defdelegate my_boards, to: Pinterex.Api.User

  @doc """
  Returns a list of the public Boards of the authenticated User.

  ## Reference

  By default the API returns their URLs, IDs and names.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)

  ## Parameters

  - options: if we wish to get other fields of the Boards we pass a list of
  fields to fetch. To see which fields are available look at `Pinterex.Structs.Board`.

  ## Example

  `Pinterex.my_boards([fields: ["image", "counts"]])`

  `Pinterex.my_boards([fields: ["image", "counts"], limit: 50])`
  """
  defdelegate my_boards(options), to: Pinterex.Api.User

  @doc """
  Returns a list of Boards that Pinterest would suggest to the authenticated User if
  they were to save the specified Pin.

  ## Reference

  By default the API returns the IDs, URLs and names of the Boards. Use `Pinterex.my_suggested_boards/2` to get other fields.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)

  ## Parameters
  - id: the id of the Pin for which you wish to get the suggestions (required)
  """
  defdelegate my_suggested_boards(id), to: Pinterex.Api.User

  @doc """
  Returns a list of Boards that Pinterest would suggest to the authenticated User if
  they were to save the specified Pin.

  ## Reference

  By default the API returns the IDs, URLs and names of the Boards.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)

  ## Parameters

  - id: the id of the Pin for which you wish to get the suggestions (required)
  - options: if we wish to get other fields of the suggested Boards we pass a list of fields to fetch. To see which fields are available look at `Pinterex.Structs.Board`.

  ## Example

  `Pinterex.my_suggested_boards("1253434223", ["image", "counts"])`

  `Pinterex.my_suggested_boards("1253434223", [fields: ["image", "counts"], limit: 5])`
  """
  defdelegate my_suggested_boards(id, options), to: Pinterex.Api.User

  @doc """
  Returns a list of Pins that the authenticated User liked.

  ## Reference

  By default the API returns the IDs, URLs, links and descriptions of the Pins. Use `Pinterex.my_likes/1` to get other fields.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)
  """
  defdelegate my_likes, to: Pinterex.Api.User

  @doc """
  Returns a list of Pins that the authenticated User liked.

  ## Reference

  By default the API returns the IDs, URLs, links and descriptions of the Pins.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)

  ## Parameters

  - options: if we wish to get other fields of the Pins we pass a list of fields to fetch. To see which fields are available look at `Pinterex.Structs.Pin`

  ## Example

  `Pinterex.my_likes([fields: ["note", "counts"]])`

  `Pinterex.my_likes([fields: ["note", "counts"], limit: 50])`
  """
  defdelegate my_likes(options), to: Pinterex.Api.User

  @doc """
  Returns a list of Pins that the authenticated User pinned.

  ## Reference

  By default the API returns the IDs, URLs, links and descriptions of the User's Pins. Use `Pinterex.my_pins/1` to get other fields.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)
  """
  defdelegate my_pins, to: Pinterex.Api.User

  @doc """
  Returns a list of Pins that the authenticated User pinned.

  ## Reference

  By default the API returns the IDs, URLs, links and descriptions of the User's Pins.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)

  ## Parameters

  - options: if we wish to get other fields of the Pins we pass a list of fields to fetch. To see which fields are available look at `Pinterex.Structs.Pin`

  ## Example
  `Pinterex.my_pins([fields: ["note", "counts"]])`

  `Pinterex.my_pins([fields: ["note", "counts"], limit: 50])`
  """
  defdelegate my_pins(options), to: Pinterex.Api.User

  @doc """
  Returns a list of the authenticated User's Boards that match the search query.

  ## Reference

  By default the API returns IDs, URLs and names of the matched Boards. Use `Pinterex.search_my_boards/2` to get other fields.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)

  ## Parameters
  - query: the query string you wish to search for (required)
  """
  defdelegate search_my_boards(query), to: Pinterex.Api.User

  @doc """
  Returns a list of the authenticated User's Boards that match the search query.

  ## Reference

  By default the API returns IDs, URLs and names of the matched Boards.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)

  ## Parameters
  - query: the query string you wish to search for (required)
  - options: if we wish to get other fields of the Boards we pass a list of
  fields to fetch. To see which fields are available look at `Pinterex.Structs.Board`.

  ## Example

  `Pinterex.search_my_boards("garden", [fields: ["image', "counts"]])`

  `Pinterex.search_my_boards("garden", [fields: ["image', "counts"], limit: 50])`
  """
  defdelegate search_my_boards(query, options), to: Pinterex.Api.User

  @doc """
  Returns a list of the authenticated User's Pins that match the search query.

  ## Reference

  By default the API returns IDs, URLs, links and descriptions of the matched Pins. Use `Pinterex.search_my_pins/2` to get other fields.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)


  ## Parameters
  - query: the query string you wish to search for (required)
  """
  defdelegate search_my_pins(query), to: Pinterex.Api.User

  @doc """
  Returns a list of the authenticated User's Pins that match the search query.

  ## Reference

  By default the API returns IDs, URLs, links and descriptions of the matched Pins. Use `Pinterex.searchMyPins/2` to get other fields.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)


  ## Parameters
  - query: the query string you wish to search for (required)
  - options: if we wish to get other fields of the Pins we pass a list of fields to fetch. To see which fields are available look at `Pinterex.Structs.Pin`

  ## Example

  `Pinterex.search_my_pins("garden", [fields: ["note", "counts"]])`

  `Pinterex.search_my_pins("garden", [fields: ["note", "counts"], limit: 50])`
  """
  defdelegate search_my_pins(query, options), to: Pinterex.Api.User

  @doc """
  Returns the Users that follow the authenticated User.

  ## Reference

  By default the API returns the first names, last names, IDs and URLs of the Users. Use `Pinterex.my_followers/1` to get other fields.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)
  """
  defdelegate my_followers, to: Pinterex.Api.User

  @doc """
  Returns the Users that follow the authenticated User.

  ## Reference

  By default the API returns the first names, last names, IDs and URLs of the Users.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)

  ## Parameters
  - options: if we wish to get other fields of the Users we pass a list of fields to fetch. To see which fields are available look at `Pinterex.Structs.User`.

  ## Example
  `Pinterex.my_followers([fields: ["bio", "counts"]])`

  `Pinterex.my_followers([fields: ["bio", "counts"], limit: 50])`
  """
  defdelegate my_followers(options), to: Pinterex.Api.User

  @doc """
  Returns a list of Boards that the authenticated User follows.

  ## Reference

  By default the API returns the IDs, URLs and names of the Boards. Use `Pinterex.my_following_boards/1` to get other fields.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)
  """
  defdelegate my_following_boards, to: Pinterex.Api.User

  @doc """
  Returns a list of Boards that the authenticated User follows.

  ## Reference

  By default the API returns the IDs, URLs and names of the Boards.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)

  ## Parameters

  - options: if we wish to get other fields of the Boards we pass a list of fields to fetch. To see which fields are available look at `Pinterex.Structs.Board`.

  ## Example

  `Pinterex.my_following_boards([fields: ["image", "counts"]])`

  `Pinterex.my_following_boards([fields: ["image", "counts"], limit: 50])`
  """
  defdelegate my_following_boards(options), to: Pinterex.Api.User

  @doc """
  Follow the specified Board as the authenticated User.

  ## Reference

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)

  ## Parameters

  - board: the Board to follow. The format of the parameters should be
  "username/board_name"
  """
  defdelegate follow_board(board), to: Pinterex.Api.User

  @doc """
  Unfollow the specified Board as the authenticated User.

  ## Reference

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)

  ## Parameters

  - board: the Board to unfollow. The format of the parameters should be
  "username/board_name"
  """
  defdelegate unfollow_board(board), to: Pinterex.Api.User

  @doc """
  Returns a list of Interests that the authenticated User follows.

  ## Reference

  By default the API returns the IDs and names of the Interests.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)
  """
  defdelegate my_following_interests, to: Pinterex.Api.User

  @doc """
  Returns the Users that the authenticated User follows.

  ## Reference

  By default the API returns the first names, last names, IDs and URLs of the Users. Use `Pinterex.my_following_users/1` to get other fields.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)
  """
  defdelegate my_following_users, to: Pinterex.Api.User

  @doc """
  Returns the Users that the authenticated User follows.

  ## Reference

  By default the API returns the first names, last names, IDs and URLs of the Users.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)

  ## Parameters

  - options: if we wish to get other fields of the Users we pass a list of fields to fetch. To see which fields are available look at `Pinterex.Structs.User`.

  ## Example
  `Pinterex.my_following_users([fields: ["bio", "counts"]])`

  `Pinterex.my_following_users([fields: ["bio", "counts"], limit: 50])`
  """
  defdelegate my_following_users(options), to: Pinterex.Api.User

  @doc """
  Returns the information of the requested Pin.

  ## Reference

  By default the API returns the ID, URL, link and the description of the Pin. Use `Pinterex.get_pin/2` to get other fields.

  [https://developers.pinterest.com/docs/api/pins/](https://developers.pinterest.com/docs/api/pins/)

  ## Parameters

  - id: the id of the Pin
  """
  defdelegate get_pin(id), to: Pinterex.Api.Pin

  @doc """
  Returns the information of the requested Pin.

  ## Reference

  By default the API returns the ID, URL, link and the description of the Pin.

  [https://developers.pinterest.com/docs/api/pins/](https://developers.pinterest.com/docs/api/pins/)

  ## Parameters

  - id: the id of the Pin
  - options: if we wish to get other fields of the Pin we pass a list of fields to fetch. To see which fields are available look at `Pinterex.Structs.Pin`

  ## Example

  `Pinterex.get_pin("123456", [fields: ["note", "counts"]])`
  """
  defdelegate get_pin(id, options), to: Pinterex.Api.Pin

  @doc """
  Returns the Board information.

  ## Reference

  By default the API returns the ID, URL and the name of the specified Board. Use `Pinterex.get_board/2` to get other fields.

  [https://developers.pinterest.com/docs/api/boards/](https://developers.pinterest.com/docs/api/boards/)

  ## Parameters

  - board: the id of the Board whose info you wish to get. The format of the parameter should be
  "username/board_name" (required)
  """
  defdelegate get_board(board), to: Pinterex.Api.Board

  @doc """
  Returns the Board information.

  ## Reference

  By default the API returns the ID, URL and the name of the specified Board.

  [https://developers.pinterest.com/docs/api/boards/](https://developers.pinterest.com/docs/api/boards/)

  ## Parameters

  - board: the id of the Board whose info you wish to get. The format of the parameter should be
  "username/board_name" (required)
  - options: if we wish to get other fields of the Board we pass a list of fields to fetch. To see which fields are available look at `Pinterex.Structs.Board`.

  ## Example

  `Pinterex.get_board("username/board_name", [fields: ["image", "counts"]])`
  """
  defdelegate get_board(board, options), to: Pinterex.Api.Board

  @doc """
  Delete the specified Pin for the authenticated User.

  ## Reference

  [https://developers.pinterest.com/docs/api/pins/](https://developers.pinterest.com/docs/api/pins/)

  ## Parameters

  - pin: the id of the Pin you wish to delete (required)
  """
  defdelegate delete_pin(pin), to: Pinterex.Api.Pin

  @doc """
  Returns a list of Pins from the specified Board.

  ## Reference

  By default the API returns the IDs, URLs, links and descriptions of the Pins. Use `Pinterex.get_board_pins/2` to get other fields.

  [https://developers.pinterest.com/docs/api/boards/](https://developers.pinterest.com/docs/api/boards/)

  ## Parameters

  - board: the id of the Board whose pins you wish to get. The format of the parameters should be
  "username/board_name" (required)
  """
  defdelegate get_board_pins(board), to: Pinterex.Api.Board

  @doc """
  Returns a list of Pins from the specified Board.

  ## Reference

  By default the API returns the IDs, URLs, links and descriptions of the Pins.

  [https://developers.pinterest.com/docs/api/boards/](https://developers.pinterest.com/docs/api/boards/)

  ## Parameters

  - board: the id of the Board whose pins you wish to get. The format of the parameters should be
  "username/board_name" (required)
  - options: if we wish to get other fields of the Pins we pass a list of fields to fetch. To see which fields are available look at `Pinterex.Structs.Pin`.

  ## Example

  `Pinterex.get_board_pins("username/board_name", [fields: ["note", "counts']])`

  `Pinterex.get_board_pins("username/board_name", [fields: ["note", "counts'], limit: 50])`
  """
  defdelegate get_board_pins(board, options), to: Pinterex.Api.Board

  @doc """
  Creates a Board with the specified name for the authenticated User.

  ## Reference

  By default the API returns the ID, URL and name of the created Board.

  [https://developers.pinterest.com/docs/api/boards/](https://developers.pinterest.com/docs/api/boards/)

  ## Parameters

  - name: the name of the Board you wish to create (required)
  """
  defdelegate create_board(name), to: Pinterex.Api.Board

  @doc """
  Creates a Board with the specified name for the authenticated User.

  ## Reference

  By default the API returns the ID, URL and name of the created Board.

  [https://developers.pinterest.com/docs/api/boards/](https://developers.pinterest.com/docs/api/boards/)

  ## Parameters

  - name: the name of the Board you wish to create (required)
  - description: the description of the Board you wish to create (optional)
  """
  defdelegate create_board(name, description), to: Pinterex.Api.Board

  @doc """
  Deletes the specified Board for the authenticated User.

  ## Reference

  [https://developers.pinterest.com/docs/api/boards/](https://developers.pinterest.com/docs/api/boards/)

  ## Parameters

  - board: The board you want to delete. The format of the parameters should be "username/board_name"
  (required)
  """
  defdelegate delete_board(board), to: Pinterex.Api.Board

  @doc """
  Edit the specified Board for the authenticated User.

  ## Reference

  By default the API returns the ID, URL, and name of the edited Board.

  [https://developers.pinterest.com/docs/api/boards/](https://developers.pinterest.com/docs/api/boards/)

  ## Parameters

  - board: the id of the Board you wish to edit. The format of the parameters should be
  "username/board_name" (required)
  - options: you can specify a new name and / or a new descriptions.

  ## Example

  `Pinterex.edit_board("username/board_name", [name: "New name"])`

  `Pinterex.edit_board("username/board_name", [name: "New name", description: "New description"])`
  """
  defdelegate edit_board(board, options), to: Pinterex.Api.Board
end
