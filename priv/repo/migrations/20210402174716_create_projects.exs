defmodule Todoer.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :order, :integer
      add :color, :string

      timestamps()
    end

  end
end
