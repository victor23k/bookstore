defmodule Bookstore.Catalog.Book do
  use Ecto.Schema
  import Ecto.Changeset

  @moduledoc """
  Define the schema for the book entity which consists of:
    Title
    Author
    Editor
    ISBN
    Publication date
    Price
    Quantity
    Cover image
    Categories <-> Category
  """
  alias Bookstore.People.Author
  alias Bookstore.Catalog.Category

  schema "books" do
    field :title, :string
    field :editor, :string
    field :isbn, :string
    field :pub_date, :date
    field :price, :decimal
    field :quantity, :integer
    field :img, :string

    many_to_many :categories, Category, join_through: "book_categories", on_replace: :delete
    many_to_many :authors, Author, join_through: "books_authors", on_replace: :delete

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :isbn, :pub_date, :price, :quantity, :editor, :img])
    |> validate_required([:title, :isbn, :pub_date, :price, :quantity, :editor])
    |> validate_format(:isbn, ~r/^(?:\d{3}-\d{1,5}-\d{1,7}-\d{1,7}-\d)$/)
    |> validate_length(:isbn, min: 10)
    |> validate_length(:isbn, max: 17)
  end
end
