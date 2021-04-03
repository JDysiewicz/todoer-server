defmodule TodoerWeb.Schema do
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)

  alias TodoerWeb.Resolvers

  object :project do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :color, non_null(:string)
    field :order, :integer

    field :user, :user, resolve: &Resolvers.Accounts.find_user/3
  end

  object :user do
    field :id, non_null(:id)
    field :email, non_null(:string)
    field :provider, non_null(:string)
    field :inserted_at, :naive_datetime

    field :projects, list_of(:project) do
      resolve(&Resolvers.Content.find_projects/3)
    end

    field :todos, list_of(:todo)
  end

  object :todo do
    field :id, non_null(:id)
    field :name, :string
    field :project, :project
    field :user, :user
  end

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
