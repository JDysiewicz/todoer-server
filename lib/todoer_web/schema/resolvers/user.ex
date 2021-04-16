defmodule TodoerWeb.Resolvers.User do
  def list_users(_parent, _args, %{context: context}) do
    IO.inspect(context)
    users = Todoer.Accounts.list_users()
    {:ok, users}
  end

  # def find_user(_parent, %{id: id}, _info) do
  #   user = Todoer.Accounts.get_user!(id)
  #   {:ok, user}
  # end

  def find_user_from_todo(%Todoer.Content.Todo{} = todo, _args, _info) do
    user = Todoer.Accounts.get_user!(todo.user_id)
    {:ok, user}
  end

  def find_user_from_project(%Todoer.Content.Project{} = project, _args, _info) do
    user = Todoer.Accounts.get_user!(project.user_id)
    {:ok, user}
  end

  def create_user(_parent, %{input: input}, _info) do
    Todoer.Accounts.create_user(input)
  end

  def login_user(_parent, %{input: input}, _info) do
    with {:ok, user} <- Todoer.Accounts.Session.authenticate(input),
         {:ok, jwt, _} <- Todoer.Guardian.encode_and_sign(user) do
      {:ok, %{token: jwt, user: user}}
    end
  end

  def delete_user(_parent, %{id: id}, _info) do
    {num, _extra} = Todoer.Accounts.delete_user_by_id(id)

    case num do
      0 -> {:error, "no entry found with that ID"}
      _ -> {:ok, "user deleted"}
    end
  end

  def get_current_user(_parent, _args, %{context: %{current_user: current_user}}) do
    user = Todoer.Accounts.get_user!(current_user.id)
    {:ok, user}
  end
end
