defmodule TodoerWeb.Resolvers.Accounts do
  def find_user(_parent, %{id: id}, _info) do
    user = Todoer.Accounts.get_user!(id)
    {:ok, user}
  end

  def find_user(project, _args, _info) do
    user = Todoer.Accounts.get_user!(project.user_id)
    {:ok, user}
  end
end
