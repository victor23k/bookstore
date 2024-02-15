defmodule Bookstore.PeopleFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bookstore.People` context.
  """

  @doc """
  Generate a author.
  """
  def author_fixture(attrs \\ %{}) do
    {:ok, author} =
      attrs
      |> Enum.into(%{
        birth_place: "some birth_place",
        born: ~D[2024-02-12],
        dead: ~D[2024-02-13],
        death_place: "some death_place",
        name: "some name",
        surname: "some surname"
      })
      |> Bookstore.People.create_author()

    author
  end
end
