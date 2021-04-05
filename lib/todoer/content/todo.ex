defmodule Todoer.Content.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :due, :date
    field :title, :string
    field :done, :boolean
    belongs_to :user, Todoer.Accounts.User
    belongs_to :project, Todoer.Content.Project

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:title, :due, :done, :user_id, :project_id])
    |> validate_required([:title, :done, :user_id, :project_id])
  end
end
