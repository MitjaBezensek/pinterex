defmodule Pinterex.Api.User do
  alias Pinterex.Helpers.Helpers

  def me(options \\ []) do
    Pinterex.execute_request(:get, "/me/", options)
    |> Helpers.createUser
  end

  def myBoards(options \\ []) do
    Pinterex.execute_request(:get, "/me/boards/", options)
    |> Helpers.createBoards
  end

  def mySuggestedBoards(id, options \\ []) do
    Pinterex.execute_request(:get, "/me/boards/suggested/?pin=#{id}", options)
    |> Helpers.createBoards
  end

  def myLikes(options \\ []) do
    Pinterex.execute_request(:get, "/me/likes/", options)
    |> Helpers.createPins
  end

  def myPins(options \\ []) do
    Pinterex.execute_request(:get, "/me/pins/", options)
    |> Helpers.createPins
  end

  def searchMyBoards(query, options \\ []) do
    Pinterex.execute_request(:get, "/me/search/boards/?query=#{query}", options)
    |> Helpers.createBoards
  end

  def searchMyPins(query, options \\ []) do
    Pinterex.execute_request(:get, "/me/search/pins/?query=#{query}", options)
    |> Helpers.createPins
  end

  def myFollowers do
    Pinterex.execute_request(:get, "/me/followers/")
    |> Helpers.createUsers
  end

  def myFollowingBoards do
    Pinterex.execute_request(:get, "/me/following/boards/")
    |> Helpers.createBoards
  end

  def followBoard(board) do
    Pinterex.execute_request(:post, "/me/following/boards/", %{board: board})
  end

  def unfollowBoard(board) do
    Pinterex.execute_request(:delete, "/me/following/boards/" <> board <> "/")
  end

  def myFollowingInterests do
    Pinterex.execute_request(:get, "/me/following/interests/")
    |> Helpers.createInterests
  end

  def myFollowingUsers do
    Pinterex.execute_request(:get, "/me/following/users")
    |> Helpers.createUsers
  end
end
