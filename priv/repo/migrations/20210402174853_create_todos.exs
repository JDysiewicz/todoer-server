defmodule Todoer.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :title, :string
      add :due, :date
      add :done, :boolean

      timestamps()
    end

  end
end
