defmodule TodoerWeb.Schema.Types.Todo do
  use Absinthe.Schema.Notation
  import_types(Absinthe.Type.Custom)
  alias TodoerWeb.Resolvers

  object :todo do
    field(:id, non_null(:id))
    field(:title, :string)
    field(:project, :project, resolve: &Resolvers.Project.find_project_from_todo/3)
    field(:user, :user, resolve: &Resolvers.User.find_user_from_todo/3)
    field(:due, :naive_datetime)
  end

  input_object :todo_input do
    field(:title, :string)
    field(:due, :naive_datetime)
    field(:project_id, :id)
  end

  input_object :todo_update do
    field(:id, non_null(:id))
    field(:title, :string)
    field(:due, :naive_datetime)
    field(:project_id, :id)
  end
end
