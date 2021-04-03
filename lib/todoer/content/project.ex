defmodule Todoer.Content.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :color, :string
    field :name, :string
    field :order, :integer
    belongs_to :user, Todoer.Accounts.User
    has_many :todos, Todoer.Content.Todo

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :order, :color])
    |> validate_required([:name, :order, :color])
  end
end
