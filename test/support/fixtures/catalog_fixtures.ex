defmodule Bookstore.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bookstore.Catalog` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        editor: "some editor",
        author: "some author",
        img: "some img",
        isbn: "some isbn",
        price: 120.5,
        pub_date: ~D[2024-02-07],
        quantity: 42,
        title: "some title"
      })
      |> Bookstore.Catalog.create_book()

    book
  end
end
