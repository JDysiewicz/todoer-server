defmodule Todoer.Repo.Migrations.AddUserIdAndProjectIdToTodos do
  use Ecto.Migration

  def change do
    alter table("todos") do
      add :user_id, references("users", on_delete: :nothing)
      add :project_id, references("projects", on_delete: :nothing)
    end
  end
end
