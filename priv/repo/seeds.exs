# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Todoer.Repo.insert!(%Todoer.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Todoer.Content.Project
alias Todoer.Content.Todo
alias Todoer.Accounts.User
alias Todoer.Repo

%Project{name: "General", color: "red", order: 1} |> Repo.insert!()
%Todo{name: "Take out the trash", done: false} |> Repo.insert!()
%Todo{name: "Walk the dog", done: true, due: ~D[2000-01-02]} |> Repo.insert!()
