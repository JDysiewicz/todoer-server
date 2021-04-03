defmodule TodoerWeb.Schema do
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)
  import_types(TodoerWeb.Schema.AccountTypes)
  import_types(TodoerWeb.Schema.ContentTypes)

  alias TodoerWeb.Resolvers

  query do
    @desc "Get all projects"
    field :projects, list_of(:project) do
      resolve(&Resolvers.Content.list_projects/3)
    end

    @desc "Get user by id"
    field :user, :user do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Accounts.find_user/3)
    end
  end
end
