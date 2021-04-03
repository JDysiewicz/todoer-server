defmodule TodoerWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation
  alias TodoerWeb.Resolvers

  object :project do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :color, non_null(:string)
    field :order, :integer

    field :user, :user, resolve: &Resolvers.Accounts.find_user/3
  end

  object :todo do
    field :id, non_null(:id)
    field :name, :string
    field :project, :project
    field :user, :user
  end
end
