defmodule Bookstore.Catalog.Category do
  use Ecto.Schema
  import Ecto.Changeset

  @moduledoc """
  Define the schema for the category entity which consists of:
    Title
  """
  alias Bookstore.Catalog.Book
  alias Bookstore.Catalog.Category

  @type t :: %Category{}

  schema "categories" do
    field :title, :string
    field :parent_id, :integer
    belongs_to :parent, Category, foreign_key: :parent_id, references: :id, define_field: false
    has_many :children, Category, foreign_key: :parent_id, references: :id

    many_to_many :books, Book, join_through: "books_categories", on_replace: :delete

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:title, :parent_id])
    |> validate_required([:title])
    |> unique_constraint(:title)
  end
end
