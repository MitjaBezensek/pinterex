defmodule Pinterex.Api.Auth do
  @moduledoc """
  This module contains all the logic for using OAuth for making calls to the Pinterest API.
  """
  use Tesla

  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.DebugLogger

  @authorization_url "https://api.pinterest.com/oauth/"
  @token_url "https://api.pinterest.com/v1/oauth/token"

  @doc """
  Use this method to get the authorization url. Redirect your user to this url so that the user can allow your application to access his data.

  ## Parameters

  - scope: the scope of the access you wish to get. See [Pinterest documenation](https://developers.pinterest.com/docs/api/overview/) to decide what scope is appropriate.
  - redirect_uri: after the user gives you permission Pinterest will redirect to this uri. It will pass the authorization code as a parameter. The code is then used in the next step to get the access token.
  - client_id: the client id of your Pinterest app.

  ## Returns

  The url to which you should redirect your user to let him give you permission to access his data.
  """
  def get_authorize_url(scope, redirect_uri, client_id) do
    parameters = [response_type: "code", scope: scope, redirect_uri: redirect_uri,
                 client_id: client_id]
    @authorization_url <> Pinterex.Api.Base.get_fields("", parameters)
  end

  @@doc """
  After you get the code from Pinterest you can use this function to get the access token.

  ## Parameters

  - client_it: the client id of your Pinterest app.
  - client_secret: the client secret of your Pinterest app.
  - code: the code that you got in the previous step.

  ## Returns

  The function returns either:

  - {:ok, token} if the token was successfully retrieved
  - {:error, message} if the retrieval failed
  """
  def get_token(client_id, client_secret, code) do
    parameters = [grant_type: "authorization_code", client_id: client_id,
                 client_secret: client_secret, code: code]
    case post(@token_url <> Pinterex.Api.Base.get_fields("", parameters), "").body do
      %{"error" => message } -> {:error, message}
      %{"access_token" => token} -> {:ok, token}
    end
  end
end
