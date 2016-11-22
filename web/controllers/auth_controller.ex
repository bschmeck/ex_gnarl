defmodule ExGnarl.AuthController do
  require Logger

  use ExGnarl.Web, :controller
  plug Ueberauth

  alias ExGnarl.User, as: User

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    case find_or_create(auth.provider, auth.info) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Successfully logged in.")
        |> put_session(:current_user, user)
        |> redirect(to: "/")
      {:error, reason} ->
        conn
        |> put_flash(:error, reason)
        |> redirect(to: "/")
    end
  end

  defp find_or_create(:google, %{email: email} = info) do
    query = from u in User, where: u.email == ^email
    user = case Repo.one(query) do
             %User{} = user -> user
             _ ->
               %User{}
               |> User.changeset(Map.from_struct(info))
               |> Repo.insert!
           end

    {:ok, user}
  end
end
