defmodule TodoerWeb.Schema.Types.User do
  use Absinthe.Schema.Notation
  alias TodoerWeb.Resolvers

  object :user do
    field :id, :id
    field :email, :string
    field :name, :string
    field :role, :string
    field :projects, list_of(:project), resolve: &Resolvers.Project.find_projects_from_user/3
    field :todos, list_of(:todo), resolve: &Resolvers.Todo.find_todos_from_user/3
  end

  input_object :user_input do
    field(:name, non_null(:string))
    field(:email, non_null(:string))
    field(:password, non_null(:string))
    field(:password_confirmation, non_null(:string))
  end
end
