defmodule Todoer.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:name, :string)
    field :email, :string, unique: true
    field :password_hash, :string
    field :role, :string, default: "user"
    field(:password, :string, virtual: true)
    field(:password_confirmation, :string, virtual: true)

    has_many :projects, Todoer.Content.Project
    has_many :todos, Todoer.Content.Todo

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :password_confirmation, :role])
    |> validate_required([:name, :email, :password, :password_confirmation, :role])
    |> validate_format(:email, ~r/@/)
    |> update_change(:email, &String.downcase(&1))
    |> validate_length(:password, min: 5, max: 24)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> hash_password()
  end

  defp hash_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Comeonin.Argon2.add_hash(password))
  end

  defp hash_password(changeset) do
    changeset
  end
end
