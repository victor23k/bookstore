defmodule Bookstore.CatalogTest do
  use Bookstore.DataCase

  alias Bookstore.Catalog

  describe "books" do
    alias Bookstore.Catalog.Book

    import Bookstore.CatalogFixtures

    @invalid_attrs %{title: nil, editor: nil, isbn: nil, pub_date: nil, price: nil, quantity: nil, img: nil}

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Catalog.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Catalog.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{title: "some title", editor: "some editor", isbn: "some isbn", pub_date: ~D[2024-02-07], price: 120.5, quantity: 42, img: "some img"}

      assert {:ok, %Book{} = book} = Catalog.create_book(valid_attrs)
      assert book.title == "some title"
      assert book.editor == "some editor"
      assert book.isbn == "some isbn"
      assert book.pub_date == ~D[2024-02-07]
      assert book.price == 120.5
      assert book.quantity == 42
      assert book.img == "some img"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      update_attrs = %{title: "some updated title", editor: "some updated editor", isbn: "some updated isbn", pub_date: ~D[2024-02-08], price: 456.7, quantity: 43, img: "some updated img"}

      assert {:ok, %Book{} = book} = Catalog.update_book(book, update_attrs)
      assert book.title == "some updated title"
      assert book.editor == "some updated editor"
      assert book.isbn == "some updated isbn"
      assert book.pub_date == ~D[2024-02-08]
      assert book.price == 456.7
      assert book.quantity == 43
      assert book.img == "some updated img"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_book(book, @invalid_attrs)
      assert book == Catalog.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Catalog.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Catalog.change_book(book)
    end
  end
end