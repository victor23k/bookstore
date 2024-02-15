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
  alias Bookstore.Catalog.Book
  alias Bookstore.Catalog.Category
  alias Bookstore.People.Author

  @type t :: %Book{}

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
    #   |> validate_isbn()
    |> validate_pub_date()
    |> validate_number(:quantity, greater_than_or_equal_to: 0)
    |> validate_number(:price, greater_than_or_equal_to: 0)
  end

  defp validate_isbn(changeset) do
    validate_change(changeset, :isbn, fn :isbn, isbn ->
      [head | tail] =
        String.replace(isbn, "-", "")
        |> String.split("", trim: true)
        |> Enum.map(&String.to_integer(&1))

      is_valid_isbn =
        [head | Enum.map_every(tail, 2, &(&1 * 3))]
        |> Enum.sum()
        |> rem(10) == 0

      if is_valid_isbn do
        []
      else
        [isbn: "not a valid isbn number"]
      end
    end)
  end

  defp validate_pub_date(changeset) do
    validate_change(changeset, :pub_date, fn :pub_date, pub_date ->
      case DateTime.utc_now()
           |> DateTime.to_date()
           |> Date.compare(pub_date) do
        :lt ->
          [pub_date: "cannot be after today"]

        _ ->
          []
      end
    end)
  end
end
