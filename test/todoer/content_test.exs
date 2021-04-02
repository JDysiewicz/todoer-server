defmodule Todoer.ContentTest do
  use Todoer.DataCase

  alias Todoer.Content

  describe "projects" do
    alias Todoer.Content.Project

    @valid_attrs %{color: "some color", name: "some name", order: 42}
    @update_attrs %{color: "some updated color", name: "some updated name", order: 43}
    @invalid_attrs %{color: nil, name: nil, order: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_project()

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Content.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Content.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = Content.create_project(@valid_attrs)
      assert project.color == "some color"
      assert project.name == "some name"
      assert project.order == 42
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, %Project{} = project} = Content.update_project(project, @update_attrs)
      assert project.color == "some updated color"
      assert project.name == "some updated name"
      assert project.order == 43
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_project(project, @invalid_attrs)
      assert project == Content.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Content.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Content.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Content.change_project(project)
    end
  end

  describe "todos" do
    alias Todoer.Content.Todo

    @valid_attrs %{due: ~D[2010-04-17], name: "some name"}
    @update_attrs %{due: ~D[2011-05-18], name: "some updated name"}
    @invalid_attrs %{due: nil, name: nil}

    def todo_fixture(attrs \\ %{}) do
      {:ok, todo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_todo()

      todo
    end

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Content.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Content.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      assert {:ok, %Todo{} = todo} = Content.create_todo(@valid_attrs)
      assert todo.due == ~D[2010-04-17]
      assert todo.name == "some name"
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{} = todo} = Content.update_todo(todo, @update_attrs)
      assert todo.due == ~D[2011-05-18]
      assert todo.name == "some updated name"
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_todo(todo, @invalid_attrs)
      assert todo == Content.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Content.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Content.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Content.change_todo(todo)
    end
  end
end
