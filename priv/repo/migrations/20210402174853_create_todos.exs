defmodule Todoer.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :name, :string
      add :due, :date

      timestamps()
    end

  end
end
