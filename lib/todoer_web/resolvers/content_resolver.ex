defmodule TodoerWeb.ContentResolver do
  alias Todoer.Content

  def all_projects(_root, _args, _info) do
    {:ok, Content.list_projects()}
  end
end
