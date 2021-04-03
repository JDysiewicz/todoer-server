defmodule TodoerWeb.Resolvers.Content do
  alias Todoer.Content

  def list_projects(_parent, %{id: id}, _info) do
    {:ok, Content.list_user_projects(%{user: id})}
  end

  def list_projects(_parent, _args, _info) do
    {:ok, Content.list_projects()}
  end

  def find_projects(user, _args, _info) do
    IO.inspect(user)
    projects = Todoer.Repo.all(Ecto.assoc(user, :projects))
    {:ok, projects}
  end
end
