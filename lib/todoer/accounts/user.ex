defmodule Todoer.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string
    has_many :projects, Todoer.Content.Project
    has_many :todos, Todoer.Content.Todo

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :token, :provider])
    |> validate_required([:email, :token, :provider])
  end
end
