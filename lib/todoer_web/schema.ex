defmodule TodoerWeb.Schema do
  use Absinthe.Schema

  import_types(TodoerWeb.Schema.AccountTypes)
  import_types(TodoerWeb.Schema.ContentTypes)

  alias TodoerWeb.Resolvers

  query do
    @desc "Get a list of all users"
    field :users, list_of(:user), resolve: &Resolvers.Accounts.list_users/3

    # Ignore below
    @desc "Get all projects"
    field :get_projects, list_of(:project) do
      resolve(&Resolvers.Content.list_projects/3)
    end

    @desc "Get project by project id"
    field :get_project, :project do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Content.find_project/3)
    end

    @desc "Get all todos"
    field :get_todos, list_of(:todo) do
      resolve(&Resolvers.Content.list_todos/3)
    end

    @desc "Get todo by todo id"
    field :get_todo, :todo do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Content.find_todo/3)
    end

    @desc "Get user by id"
    field :get_user, :user do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Accounts.find_user/3)
    end
  end

  mutation do
    @desc "Create new user"
    field :create_user, :user do
      arg(:input, non_null(:user_input))
      resolve(&Resolvers.Accounts.create_user/3)
    end
  end
end
