defmodule Todoer.Repo do
  use Ecto.Repo,
    otp_app: :todoer,
    adapter: Ecto.Adapters.Postgres
end
