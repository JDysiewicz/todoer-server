defmodule TodoerWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation
  import_types(Absinthe.Type.Custom)
  alias TodoerWeb.Resolvers

  object :project do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :color, non_null(:string)
    field :order, :integer
    field :user, :user, resolve: &Resolvers.Accounts.find_user/3
    field :todos, list_of(:todo), resolve: &Resolvers.Content.find_todos/3
  end

  object :todo do
    field :id, non_null(:id)
    field :name, :string
    field :project, :project, resolve: &Resolvers.Content.find_project/3
    field :user, :user, resolve: &Resolvers.Accounts.find_user/3
    field :due, :naive_datetime
  end

  input_object :project_input do
    field :name, non_null(:string)
    field :color, non_null(:string)
    field :order, :integer
  end
end
