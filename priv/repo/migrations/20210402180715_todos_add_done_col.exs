defmodule Todoer.Repo.Migrations.TodosAddDoneCol do
  use Ecto.Migration

  def change do
    alter table("todos") do
      add :done, :boolean
    end
  end
end
