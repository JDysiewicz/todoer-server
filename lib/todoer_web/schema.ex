defmodule TodoerWeb.Schema do
  use Absinthe.Schema

  alias TodoerWeb.ContentResolver

  object :project do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :color, non_null(:string)
    field :order, :integer
  end

  query do
    @desc "Get all projects"
    field :all_projects, non_null(list_of(non_null(:project))) do
      resolve(&ContentResolver.all_projects/3)
    end
  end
end
