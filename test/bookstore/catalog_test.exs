defmodule Bookstore.CatalogTest do
  use Bookstore.DataCase

  alias Bookstore.Catalog

  describe "categories" do
    alias Bookstore.Catalog.Category

    import Bookstore.CatalogFixtures

    @invalid_attrs %{title: nil}

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Catalog.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Catalog.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Category{} = category} = Catalog.create_category(valid_attrs)
      assert category.title == "some title"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Category{} = category} = Catalog.update_category(category, update_attrs)
      assert category.title == "some updated title"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_category(category, @invalid_attrs)
      assert category == Catalog.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Catalog.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Catalog.change_category(category)
    end
  end

  describe "books" do
    alias Bookstore.Catalog.Book

    import Bookstore.CatalogFixtures

    @invalid_attrs %{
      title: nil,
      editor: nil,
      isbn: nil,
      pub_date: nil,
      price: nil,
      quantity: nil,
      img: nil
    }

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Catalog.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Catalog.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{
        title: "some title",
        editor: "some editor",
        isbn: "978-84-663-0446-5",
        pub_date: ~D[2024-02-11],
        price: 120.5,
        quantity: 42,
        img: "some img"
      }

      assert {:ok, %Book{} = book} = Catalog.create_book(valid_attrs)
      assert book.title == "some title"
      assert book.editor == "some editor"
      assert book.isbn == "978-84-663-0446-5"
      assert book.pub_date == ~D[2024-02-11]
      assert book.price == 120.5
      assert book.quantity == 42
      assert book.img == "some img"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()

      update_attrs = %{
        title: "some updated title",
        editor: "some updated editor",
        isbn: "some updated isbn",
        pub_date: ~D[2024-02-12],
        price: 456.7,
        quantity: 43,
        img: "some updated img"
      }

      assert {:ok, %Book{} = book} = Catalog.update_book(book, update_attrs)
      assert book.title == "some updated title"
      assert book.editor == "some updated editor"
      assert book.isbn == "some updated isbn"
      assert book.pub_date == ~D[2024-02-12]
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
