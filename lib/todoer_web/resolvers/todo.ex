defmodule TodoerWeb.Resolvers.Todo do
  # def list_todos(_parent, _args, _info) do
  #   todos = Todoer.Content.list_todos()
  #   {:ok, todos}
  # end

  # @doc """
  # Returns a list of todos that belong to a user, when user is parent in GQL
  # """
  def find_todos_from_user(%Todoer.Accounts.User{} = user, _args, _info) do
    todos = Todoer.Repo.all(Ecto.assoc(user, :todos))
    {:ok, todos}
  end

  def find_todos_from_project(%Todoer.Content.Project{} = project, _args, _info) do
    todos = Todoer.Repo.all(Ecto.assoc(project, :todos))
    {:ok, todos}
  end

  # def find_todo(_parent, %{id: id}, _info) do
  #   todo = Todoer.Content.get_todo!(id)
  #   {:ok, todo}
  # end
end
