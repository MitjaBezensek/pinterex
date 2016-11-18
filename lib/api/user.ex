defmodule Pinterex.Api.User do
  alias Pinterex.Helpers.Helpers

  def me do
    Pinterex.request2(:get, "/me/")
    |> Helpers.createUser
  end

  def myBoards do
    Pinterex.request2(:get, "/me/boards/")
    |> Helpers.createBoards
  end

  def mySuggestedBoards(id) do
    Pinterex.request2(:get, "/me/boards/suggested/?pin=#{id}")
    |> Helpers.createBoards
  end

  def myLikes do
    Pinterex.request2(:get, "/me/likes/")
    |> Helpers.createPins
  end

  def myPins do
    Pinterex.request2(:get, "/me/pins/")
    |> Helpers.createPins
  end

  def searchMyBoards(query) do
    Pinterex.request2(:get, "/me/search/boards/?query=#{query}")
    |> Helpers.createBoards
  end

  def searchMyPins(query) do
    Pinterex.request2(:get, "/me/search/pins/?query=#{query}")
    |> Helpers.createPins
  end

  def myFollowers do
    Pinterex.request2(:get, "/me/followers/")
    |> Helpers.createUsers
  end

  def myFollowingBoards do
    Pinterex.request2(:get, "/me/following/boards/")
    |> Helpers.createBoards
  end

  def myFollowingInterests do
    Pinterex.request2(:get, "/me/following/interests/")
    |> Helpers.createInterests
  end

  def myFollowingUsers do
    Pinterex.request2(:get, "/me/following/users")
    |> Helpers.createUsers
  end
end
