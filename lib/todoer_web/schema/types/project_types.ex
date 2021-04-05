defmodule TodoerWeb.Schema.Types.Project do
  use Absinthe.Schema.Notation
  alias TodoerWeb.Resolvers

  object :project do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :color, non_null(:string)
    field :order, :integer
    field :user, :user, resolve: &Resolvers.User.find_user_from_project/3
    field :todos, list_of(:todo), resolve: &Resolvers.Todo.find_todos_from_project/3
  end

  input_object :project_input do
    field :name, non_null(:string)
    field :color, non_null(:string)
    field :order, :integer
  end
end
