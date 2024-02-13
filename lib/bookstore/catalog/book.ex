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
  alias Bookstore.Catalog.Category

  schema "books" do
    field :title, :string
    field :author, :string
    field :editor, :string
    field :isbn, :string
    field :pub_date, :date
    field :price, :decimal
    field :quantity, :integer
    field :img, :string

    many_to_many :categories, Category, join_through: "book_categories", on_replace: :delete

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :author, :isbn, :pub_date, :price, :quantity, :editor, :img])
    |> cast_assoc(:categories)
    |> validate_required([:title, :author, :isbn, :pub_date, :price, :quantity, :editor])
  end
end
