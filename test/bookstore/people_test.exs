defmodule Bookstore.PeopleTest do
  use Bookstore.DataCase

  alias Bookstore.People

  describe "authors" do
    alias Bookstore.People.Author

    import Bookstore.PeopleFixtures

    @invalid_attrs %{
      name: nil,
      dead: nil,
      surname: nil,
      born: nil,
      birth_place: nil,
      death_place: nil
    }

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert People.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert People.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      valid_attrs = %{
        name: "some name",
        dead: ~D[2024-02-12],
        surname: "some surname",
        born: ~D[2024-02-12],
        birth_place: "some birth_place",
        death_place: "some death_place"
      }

      assert {:ok, %Author{} = author} = People.create_author(valid_attrs)
      assert author.name == "some name"
      assert author.dead == ~D[2024-02-12]
      assert author.surname == "some surname"
      assert author.born == ~D[2024-02-12]
      assert author.birth_place == "some birth_place"
      assert author.death_place == "some death_place"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = People.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()

      update_attrs = %{
        name: "some updated name",
        dead: ~D[2024-02-13],
        surname: "some updated surname",
        born: ~D[2024-02-13],
        birth_place: "some updated birth_place",
        death_place: "some updated death_place"
      }

      assert {:ok, %Author{} = author} = People.update_author(author, update_attrs)
      assert author.name == "some updated name"
      assert author.dead == ~D[2024-02-13]
      assert author.surname == "some updated surname"
      assert author.born == ~D[2024-02-13]
      assert author.birth_place == "some updated birth_place"
      assert author.death_place == "some updated death_place"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = People.update_author(author, @invalid_attrs)
      assert author == People.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = People.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> People.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = People.change_author(author)
    end
  end
end
