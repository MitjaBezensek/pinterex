defmodule Pinterex do
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
  defdelegate execute_request(method, path, options), to: Pinterex.Api.Base

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
  `Pinterex.me(["bio", "counts"])`
  """
  defdelegate me(options), to: Pinterex.Api.User

  @doc """
  Returns a list of the public Boards of the authenticated User.

  ## Reference

  By default the API returns their URLs, IDs and names. Use `Pinterex.myBoards/1` to get other fields.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)
  """
  defdelegate myBoards, to: Pinterex.Api.User

  @doc """
  Returns a list of the public Boards of the authenticated User.

  ## Reference

  By default the API returns their URLs, IDs and names.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)

  ## Parameters

  - options: if we wish to get other fields of the Boards we pass a list of
  fields to fetch. To see which fields are available look at `Pinterex.Structs.Board`.

  ## Example

  `Pinterex.myBoards(["image", "counts"])`
  """
  defdelegate myBoards(options), to: Pinterex.Api.User

  @doc """
  Returns a list of Boards that Pinterest would suggest to the authenticated User if
  they were to save the specified Pin.

  ## Reference 

  By default the API returns the IDs, URLs and names of the Boards. Use `Pinterex.mySuggestedBoards/2` to get other fields.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)

  ## Parameters
  - id: the id of the Pin for which you wish to get the suggestions (required)
  """
  defdelegate mySuggestedBoards(id), to: Pinterex.Api.User

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

  `Pinterex.mySuggestedBoards("1253434223", ["image", "counts"])`
  """
  defdelegate mySuggestedBoards(id, options), to: Pinterex.Api.User

  @doc """
  Returns a list of Pins that the authenticated User liked.

  ## Reference

  By default the API returns the IDs, URLs, links and descriptions of the Pins. Use `Pinterex.myLikes/1` to get other fields.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)
  """
  defdelegate myLikes, to: Pinterex.Api.User

  @doc """
  Returns a list of Pins that the authenticated User liked.

  ## Reference

  By default the API returns the IDs, URLs, links and descriptions of the Pins.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)

  ## Parameters

  - options: if we wish to get other fields of the Pins we pass a list of fields to fetch. To see which fields are available look at `Pinterex.Structs.Pin`

  ## Example

  `Pinterex.myLikes(["note", "counts"])`
  """
  defdelegate myLikes(options), to: Pinterex.Api.User

  @doc """
  Returns a list of Pins that the authenticated User pinned.

  ## Reference

  By default the API returns the IDs, URLs, links and descriptions of the User's Pins. Use `Pinterex.myPins/1` to get other fields.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)
  """
  defdelegate myPins, to: Pinterex.Api.User

  @doc """
  Returns a list of Pins that the authenticated User pinned.

  ## Reference

  By default the API returns the IDs, URLs, links and descriptions of the User's Pins.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)

  ## Parameters

  - options: if we wish to get other fields of the Pins we pass a list of fields to fetch. To see which fields are available look at `Pinterex.Structs.Pin`

  ## Example
  `Pinterex.myPins(["note", "counts"])`
  """
  defdelegate myPins(options), to: Pinterex.Api.User

  @doc """
  Returns a list of the authenticated User's Boards that match the search query.

  ## Reference

  By default the API returns IDs, URLs and names of the matched Boards. Use `Pinterex.searchMyBoards/2` to get other fields.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)

  ## Parameters
  - query: the query string you wish to search for (required)
  """
  defdelegate searchMyBoards(query), to: Pinterex.Api.User

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

  `Pinterex.searchMyBoards("garden", ["image', "counts"])`
  """
  defdelegate searchMyBoards(query, options), to: Pinterex.Api.User

  @doc """
  Returns a list of the authenticated User's Pins that match the search query.

  ## Reference

  By default the API returns IDs, URLs, links and descriptions of the matched Pins. Use `Pinterex.searchMyPins/2` to get other fields.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)


  ## Parameters
  - query: the query string you wish to search for (required)
  """
  defdelegate searchMyPins(query), to: Pinterex.Api.User

  @doc """
  Returns a list of the authenticated User's Pins that match the search query.

  ## Reference

  By default the API returns IDs, URLs, links and descriptions of the matched Pins. Use `Pinterex.searchMyPins/2` to get other fields.

  [https://developers.pinterest.com/docs/api/users/](https://developers.pinterest.com/docs/api/users/)


  ## Parameters
  - query: the query string you wish to search for (required)
  - options: if we wish to get other fields of the Pins we pass a list of fields to fetch. To see which fields are available look at `Pinterex.Structs.Pin`

  ## Example
  
  `Pinterex.searchMyPins("garden", ["note", "counts"])`
  """
  defdelegate searchMyPins(query, options), to: Pinterex.Api.User

  @doc """
  Returns the Users that follow the authenticated User
  https://developers.pinterest.com/docs/api/v1/me/followers/

  By default the API returns the first names, last names, IDs and URLs of the Users.
  """
  defdelegate myFollowers, to: Pinterex.Api.User

  @doc """
  Returns a list of Boards that the authenticated User follows.
  https://developers.pinterest.com/docs/api/v1/me/following/boards/

  By default the API returns the IDs, URLs and names of the Boards.
  """
  defdelegate myFollowingBoards, to: Pinterex.Api.User

  @doc """
  Follow the specified Board as the authenticated User.
  https://developers.pinterest.com/docs/api/v1/me/following/boards/

  ## Parameters
  - board: the Board to follow. The format of the parameters should be
  "username/board_name"
  """
  defdelegate followBoard(board), to: Pinterex.Api.User

  @doc """
  Unfollow the specified Board as the authenticated User.
  https://developers.pinterest.com/docs/api/v1/me/following/boards/

  ## Parameters
  - board: the Board to unfollow. The format of the parameters should be
  "username/board_name"
  """
  defdelegate unfollowBoard(board), to: Pinterex.Api.User

  @doc """
  Returns a list of Interests that the authenticated User follows.
  https://developers.pinterest.com/docs/api/v1/me/following/interests/

  By default the API returns the IDs and names of the Interests.
  """
  defdelegate myFollowingInterests, to: Pinterex.Api.User

  @doc """
  Returns the Users that the authenticated User follows.
  https://developers.pinterest.com/docs/api/v1/me/following/users/

  By default the API returns the first names, last names, IDs and URLs of the Users.
  """
  defdelegate myFollowingUsers, to: Pinterex.Api.User

  @doc """
  Returns the information of the requested Pin.
  https://developers.pinterest.com/docs/api/v1/pins/<pin>/

  By default the API returns the ID, URL, link and the description of the Pin.

  ## Parameters
  - id: the id of the Pin
  """
  defdelegate getPin(id), to: Pinterex.Api.Pin

  @doc """
  Returns the Board information.
  https://developers.pinterest.com/docs/api/v1/boards/<board>/

  By default the API returns the ID, URL and the name of the specified Board

  ## Parameters
  - board: the id of the Board whose info you wish to get. The format of the parameter should be
  "username/board_name" (required)
  """
  defdelegate getBoard(board), to: Pinterex.Api.Board

  @doc """
  Delete the specified Pin for the authenticated User.
  https://developers.pinterest.com/docs/api/v1/pins/<pin>

  ## Parameters
  - pin: the id of the Pin you wish to delete (required)
  """
  defdelegate deletePin(pin), to: Pinterex.Api.Pin

  # @doc """
  # Edit the specified Pin for the authenticated User.
  # https://developers.pinterest.com/docs/api/v1/pins/<pin>

  # ## Parameters
  # - pin: the id of the Pin you wish to edit (required)
  # - board: the Board you want to move the Pin to. The format of the parameters should be "username/board_name" (optional)
  # - note: the new description (optional)
  # - link: the new Pin link (optional)
  # """
  #defdelegate editPin(pin, board \\ nil, note \\ nil, link \\ nil), to: Pinterex.Api.Board

  @doc """
  Returns a list of Pins from the specified Board.
  https://developers.pinterest.com/docs/api/v1/boards/<board>/pins/

  By default the API returns the IDs, URLs, links and descriptions of the Pins.

  ## Parameters
  - board: the id of the Board whose pins you wish to get. The format of the parameters should be
  "username/board_name" (required)
  """
  defdelegate getBoardPins(board), to: Pinterex.Api.Board

  @doc """
  Creates a Board with the specified name for the authenticated User.
  https://developers.pinterest.com/docs/api/v1/boards/

  By default the API returns the ID, URL and name of the created Board.

  ## Parameters
  - name: the name of the Board you wish to create (required)
  - description: the description of the Board you wish to create (optional)
  """
  defdelegate createBoard(name, description \\ nil), to: Pinterex.Api.Board

  @doc """
  Deletes the specified Board for the authenticated User.
  https://developers.pinterest.com/docs/api/v1/boards/<board>

  ## Parameters
  - board: The board you want to delete. The format of the parameters should be "username/board_name"
  (required)
  """
  defdelegate deleteBoard(board), to: Pinterex.Api.Board

  @doc """
  Edit the specified Board for the authenticated User.
  https://developers.pinterest.com/docs/api/v1/boards/<board>

  By default the API returns the ID, URL, and name of the edited Board.

  ## Parameters
  - board: the id of the Board you wish to edit. The format of the parameters should be
  "username/board_name" (required)
  - name: the new name of the Board (optional)
  - description: the new description of the Board (optional)
  """
  defdelegate editBoard(board, name \\ nil, description \\ nil), to: Pinterex.Api.Board
end
