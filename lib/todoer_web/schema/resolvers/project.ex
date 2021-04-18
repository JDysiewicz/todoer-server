defmodule TodoerWeb.Resolvers.Project do
  # @doc """
  # Returns a list of projects that belong to a user, based off user id.
  # """
  # def list_projects(_parent, _args, _info) do
  #   projects = Todoer.Content.list_projects()
  #   {:ok, projects}
  # end

  import Ecto.Query, warn: false

  def list_projects(_parent, _args, %{context: %{current_user: current_user}}) do
    projects = Todoer.Repo.all(Ecto.assoc(current_user, :projects))
    {:ok, projects}
  end

  def find_projects_from_user(%Todoer.Accounts.User{} = user, _args, _info) do
    projects = Todoer.Repo.all(Ecto.assoc(user, :projects))
    {:ok, projects}
  end

  # def find_project(_parent, %{id: id}, _info) do
  #   project = Todoer.Content.get_project!(id)
  #   {:ok, project}
  # end

  def find_project_from_todo(%Todoer.Content.Todo{} = todo, _args, _info) do
    project = Todoer.Content.get_project!(todo.project_id)
    {:ok, project}
  end

  def create_project(_parent, %{input: input}, %{context: %{current_user: current_user}}) do
    project_input = Map.merge(input, %{user_id: current_user.id})
    Todoer.Content.create_project(project_input)
  end

  def update_project(_parent, %{input: input}, _info) do
    project = Todoer.Content.get_project!(input.id)
    Todoer.Content.update_project(project, input)
  end

  def get_project(_parent, %{project_id: project_id}, %{context: %{current_user: current_user}}) do
    query =
      from(p in Todoer.Content.Project,
        where: p.id == ^project_id and p.user_id == ^current_user.id
      )

    project = Todoer.Repo.one(query)
    {:ok, project}
  end

  def delete_project(_parent, %{id: id}, _info) do
    {num, _extra} = Todoer.Content.delete_project_by_id(id)

    case num do
      0 -> {:error, "no entry found with that ID"}
      _ -> {:ok, "project deleted"}
    end
  end
end
