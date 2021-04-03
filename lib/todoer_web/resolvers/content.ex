defmodule TodoerWeb.Resolvers.Content do
  @doc """
  Returns a list of projects that belong to a user, based off user id.
  """
  def list_projects(_parent, _args, _info) do
    projects = Todoer.Content.list_projects()
    {:ok, projects}
  end

  def list_todos(_parent, _args, _info) do
    todos = Todoer.Content.list_todos()
    {:ok, todos}
  end

  @doc """
  Returns a list of projects that belong to a user, when user is parent in GQL
  """
  def find_projects(%Todoer.Accounts.User{} = user, _args, _info) do
    projects = Todoer.Repo.all(Ecto.assoc(user, :projects))
    {:ok, projects}
  end

  def find_project(_parent, %{id: id}, _info) do
    project = Todoer.Content.get_project!(id)
    {:ok, project}
  end

  @doc """
  Returns a list of projects that belong to a user, when todo is parent in GQL
  """
  def find_project(%Todoer.Content.Todo{} = todo, _args, _info) do
    project = Todoer.Content.get_project!(todo.project_id)
    {:ok, project}
  end

  @doc """
  Returns a list of todos that belong to a user, when user is parent in GQL
  """
  def find_todos(%Todoer.Accounts.User{} = user, _args, _info) do
    todos = Todoer.Repo.all(Ecto.assoc(user, :todos))
    {:ok, todos}
  end

  @doc """
  Returns a list of todos that belong to a project, when project is parent in GQL
  """
  def find_todos(%Todoer.Content.Project{} = project, _args, _info) do
    todos = Todoer.Repo.all(Ecto.assoc(project, :todos))
    {:ok, todos}
  end

  def find_todo(_parent, %{id: id}, _info) do
    todo = Todoer.Content.get_todo!(id)
    {:ok, todo}
  end

  def create_project(_parent, args, _info) do
    Todoer.Content.create_project(%{
      name: args.name,
      order: args.order,
      color: args.color,
      user_id: args.userId
    })
  end
end
