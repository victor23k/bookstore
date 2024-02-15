defmodule Bookstore.People.Author do
  alias Bookstore.Catalog.Book
  use Ecto.Schema
  import Ecto.Changeset

  schema "authors" do
    field :name, :string
    field :dead, :date
    field :surname, :string
    field :born, :date
    field :birth_place, :string
    field :death_place, :string

    many_to_many :books, Book, join_through: "books_authors", on_replace: :delete

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:name, :surname, :born, :dead, :birth_place, :death_place])
    |> validate_required([:name, :surname, :born, :birth_place])
    |> check_constraint(:born, name: :born_before_dead, message: "Author can't be born after dead")
  end
end
