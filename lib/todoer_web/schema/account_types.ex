defmodule TodoerWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation
  alias TodoerWeb.Resolvers

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
end
