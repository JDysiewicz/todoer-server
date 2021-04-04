defmodule Todoer.Repo.Migrations.AddUserIdAndProjectIdToTodos do
  use Ecto.Migration

  def change do
    alter table("todos") do
      add :user_id, references("users", on_delete: :delete_all)
      add :project_id, references("projects", on_delete: :delete_all)
    end
  end
end
