defmodule Pinterex.Api.User do
  @moduledoc """
  This module handles the User and profile specific API calls.
  """

  alias Pinterex.Helpers.Helpers

  def me(options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_user/1, "/me/", options)
  end

  def my_boards(options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_boards/1, "/me/boards/", options)
  end

  def my_suggested_boards(id, options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_boards/1, "/me/boards/suggested/?pin=#{id}", options)
  end

  def my_likes(options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_pins/1, "/me/likes/", options)
  end

  def my_pins(options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_pins/1, "/me/pins/", options)
  end

  def search_my_boards(query, options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_boards/1, "/me/search/boards/?query=#{query}", options)
  end

  def search_my_pins(query, options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_pins/1, "/me/search/pins/?query=#{query}", options)
  end

  def my_followers(options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_users/1, "/me/followers/", options)
  end

  def my_following_boards(options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_boards/1, "/me/following/boards/", options)
  end

  def follow_board(board) do
    Pinterex.execute_request(:post, "/me/following/boards/", %{board: board})
  end

  def unfollow_board(board) do
    Pinterex.execute_request(:delete, "/me/following/boards/" <> board <> "/")
  end

  def my_following_interests do
    Pinterex.execute_request(:get, &Helpers.create_interests/1, "/me/following/interests/")
  end

  def my_following_users(options \\ []) do
    Pinterex.execute_request(:get, &Helpers.create_users/1, "/me/following/users", options)
  end
end
