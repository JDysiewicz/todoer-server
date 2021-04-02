# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :todoer,
  ecto_repos: [Todoer.Repo]

# Configures the endpoint
config :todoer, TodoerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "O74CpxX+ZStV07/VtMCXYccRDnm6Gdz6M8uFaewvmOxerueC9qLBM67nrwbBud/Y",
  render_errors: [view: TodoerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Todoer.PubSub,
  live_view: [signing_salt: "SyPEJVkM"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
