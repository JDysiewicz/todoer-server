defmodule Todoer.Content.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :color, :string
    field :name, :string
    field :order, :integer

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :order, :color])
    |> validate_required([:name, :order, :color])
  end
end
