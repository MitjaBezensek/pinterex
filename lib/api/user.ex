defmodule Pinterex.Api.User do
  alias Pinterex.Structs.{User, Board, Pin, Interest}

  def me do
    Pinterex.request2(:get, "/me/")
    |> User.new
  end

  def myBoards do
    Pinterex.request2(:get, "/me/boards/")
    |> createBoards
  end

  def mySuggestedBoards(id) do
    Pinterex.request2(:get, "/me/boards/suggested/?pin=#{id}")
    |> createBoards
  end

  def myLikes do
    Pinterex.request2(:get, "/me/likes/")
    |> createPins
  end

  def myPins do
    Pinterex.request2(:get, "/me/pins/")
    |> createPins
  end

  def searchMyBoards(query) do
    Pinterex.request2(:get, "/me/search/boards/?query=#{query}")
    |> createBoards
  end

  def searchMyPins(query) do
    Pinterex.request2(:get, "/me/search/pins/?query=#{query}")
    |> createPins
  end

  def myFollowers do
    Pinterex.request2(:get, "/me/followers/")
    |> createUsers
  end

  def myFollowingBoards do
    Pinterex.request2(:get, "/me/following/boards/")
    |> createBoards
  end

  def myFollowingInterests do
    Pinterex.request2(:get, "/me/following/interests/")
    |> createInterests
  end

  def myFollowingUsers do
    Pinterex.request2(:get, "/me/following/users")
    |> createUsers
  end

  def createBoards(boards) do
    boards
    |> Enum.map(fn board -> Board.new(board) end)
  end

  def createPins(pins) do
    pins
    |> Enum.map(fn pin -> Pin.new(pin) end)
  end

  def createUsers(users) do
    users
    |> Enum.map(fn user -> User.new(user) end)
  end

  def createInterests(interests) do
    interests
    |> Enum.map(fn interest -> Interest.new(interest) end)
  end
end
