defmodule Todoer.Content.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :due, :date
    field :name, :string
    field :done, :boolean

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:name, :due, :done])
    |> validate_required([:name, :done])
  end
end
