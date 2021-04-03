defmodule TodoerWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation
  alias TodoerWeb.Resolvers

  object :user do
    field :id, :id
    field :email, :string
    field :name, :string
    field :role, :string

    field :projects, list_of(:project) do
      resolve(&Resolvers.Content.find_projects/3)
    end

    field :todos, list_of(:todo), resolve: &Resolvers.Content.find_todos/3
  end

  input_object :user_input do
    field(:name, non_null(:string))
    field(:email, non_null(:string))
    field(:password, non_null(:string))
    field(:password_confirmation, non_null(:string))
  end
end
