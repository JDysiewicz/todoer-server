defmodule TodoerWeb.Resolvers.Accounts do
  def list_users(_parent, _args, _info) do
    users = Todoer.Accounts.list_users()
    {:ok, users}
  end

  def find_user(_parent, %{id: id}, _info) do
    user = Todoer.Accounts.get_user!(id)
    {:ok, user}
  end

  def find_user(project, _args, _info) do
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
end
