defmodule TodoerWeb.Schema do
  use Absinthe.Schema
  alias TodoerWeb.Resolvers
  alias TodoerWeb.Schema.Middleware

  import_types(TodoerWeb.Schema.Types.User)
  import_types(TodoerWeb.Schema.Types.Session)
  import_types(TodoerWeb.Schema.Types.Project)
  import_types(TodoerWeb.Schema.Types.Todo)

  query do
    @desc "Get a list of all users"
    field :users, list_of(:user) do
      middleware(Middleware.Authorize, "admin")
      resolve(&Resolvers.User.list_users/3)
    end

    @desc "Get a list of all projects for a logged-in user"
    field :projects, list_of(:project) do
      middleware(Middleware.Authorize, :any)
      resolve(&Resolvers.Project.list_projects/3)
    end
  end

  mutation do
    @desc "Create new user"
    field :create_user, :user do
      arg(:input, non_null(:user_input))
      resolve(&Resolvers.User.create_user/3)
    end

    @desc "Login a user and return a JWT"
    field :login_user, :session do
      arg(:input, non_null(:session_input))
      resolve(&Resolvers.User.login_user/3)
    end

    @desc "Create a project for logged-in user"
    field :create_project, :project do
      middleware(Middleware.Authorize, :any)
      arg(:input, non_null(:project_input))
      resolve(&Resolvers.Project.create_project/3)
    end

    @desc "Update a project for logged-in user"
    field :update_project, :project do
      middleware(Middleware.Authorize, :any)
      arg(:input, non_null(:project_update))
      resolve(&Resolvers.Project.update_project/3)
    end

    @desc "Delete a project by ID for logged-in user"
    field :delete_project, :string do
      middleware(Middleware.Authorize, :any)
      arg(:id, non_null(:id))
      resolve(&Resolvers.Project.delete_project/3)
    end

    @desc "Create a todo for logged-in user"
    field :create_todo, :todo do
      middleware(Middleware.Authorize, :any)
      arg(:input, non_null(:todo_input))
      resolve(&Resolvers.Todo.create_todo/3)
    end

    @desc "Delete a Todo by ID for logged-in user"
    field :delete_todo, :string do
      middleware(Middleware.Authorize, :any)
      arg(:id, non_null(:id))
      resolve(&Resolvers.Todo.delete_todo/3)
    end
  end
end
