defmodule ExGnarl.User do
  use ExGnarl.Web, :model
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `user` and `params`.
  """
  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:email, :name])
    |> validate_required([:email, :name])
  end
end
