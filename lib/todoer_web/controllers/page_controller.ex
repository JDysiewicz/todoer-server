defmodule TodoerWeb.PageController do
  use TodoerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
