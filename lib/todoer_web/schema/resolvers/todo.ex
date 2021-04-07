defmodule TodoerWeb.Resolvers.Todo do
  def find_todos_from_user(%Todoer.Accounts.User{} = user, _args, _info) do
    todos = Todoer.Repo.all(Ecto.assoc(user, :todos))
    {:ok, todos}
  end

  def find_todos_from_project(%Todoer.Content.Project{} = project, _args, _info) do
    todos = Todoer.Repo.all(Ecto.assoc(project, :todos))
    {:ok, todos}
  end

  def create_todo(_parent, %{input: input}, %{context: %{current_user: current_user}}) do
    todo_input = Map.merge(input, %{user_id: current_user.id})
    Todoer.Content.create_todo(todo_input)
  end

  def update_todo(_parent, %{input: input}, _info) do
    todo = Todoer.Content.get_todo!(input.id)
    Todoer.Content.update_todo(todo, input)
  end

  def delete_todo(_parent, %{id: id}, _info) do
    {num, _extra} = Todoer.Content.delete_todo_by_id(id)

    case num do
      0 -> {:error, "no entry found with that ID"}
      _ -> {:ok, "todo deleted"}
    end
  end
end
