defmodule Pinterex.Api.User do
  @moduledoc """
  This module handles the User and profile specific API calls.
  """

  alias Pinterex.Helpers.Helpers

  def me(options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_user/1, "/me/", options)
  end

  def myBoards(options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_boards/1, "/me/boards/", options)
  end

  def mySuggestedBoards(id, options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_boards/1, "/me/boards/suggested/?pin=#{id}", options)
  end

  def myLikes(options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_pins/1, "/me/likes/", options)
  end

  def myPins(options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_pins/1, "/me/pins/", options)
  end

  def searchMyBoards(query, options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_boards/1, "/me/search/boards/?query=#{query}", options)
  end

  def searchMyPins(query, options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_pins/1, "/me/search/pins/?query=#{query}", options)
  end

  def myFollowers(options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_users/1, "/me/followers/", options)
  end

  def myFollowingBoards(options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_boards/1, "/me/following/boards/", options)
  end

  def followBoard(board) do
    Pinterex.execute_request(:post, "/me/following/boards/", %{board: board})
  end

  def unfollowBoard(board) do
    Pinterex.execute_request(:delete, "/me/following/boards/" <> board <> "/")
  end

  def myFollowingInterests do
    Pinterex.execute_request(:get, &Helpers.create_interests/1, "/me/following/interests/")
  end

  def myFollowingUsers(options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_users/1, "/me/following/users", options)
  end
end
