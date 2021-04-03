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

%User{email: "test@mctester.com", token: "123456", provider: "github"} |> Repo.insert!()
%User{email: "test2@mctester2.com", token: "abcsd", provider: "facebook"} |> Repo.insert!()
%Project{name: "General", color: "red", order: 1, user_id: 1} |> Repo.insert!()
%Project{name: "Alloha", color: "green", order: 3, user_id: 2} |> Repo.insert!()
%Todo{name: "Take out the trash", done: false, project_id: 1, user_id: 1} |> Repo.insert!()
%Todo{name: "Walk the dog", done: true, due: ~D[2000-01-02], user_id: 1} |> Repo.insert!()
%Todo{name: "Take out the trash", done: false, project_id: 2, user_id: 2} |> Repo.insert!()
%Todo{name: "Walk the dog", done: true, due: ~D[2000-01-02], user_id: 2} |> Repo.insert!()
