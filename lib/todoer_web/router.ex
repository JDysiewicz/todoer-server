defmodule TodoerWeb.Router do
  use TodoerWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
    plug(TodoerWeb.Plugs.Context)
  end

  scope "/api" do
    pipe_through(:api)

    forward("/graphql", Absinthe.Plug, schema: TodoerWeb.Schema)

    if Mix.env() == :dev do
      forward("/graphiql", Absinthe.Plug.GraphiQL,
        schema: TodoerWeb.Schema,
        interface: :simple,
        context: %{pubsub: TodoerWeb.Endpoint}
      )
    end
  end
end
