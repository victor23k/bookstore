defmodule Bookstore.Catalog.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :title, :string
    field :author, :string
    field :editor, :string
    field :isbn, :string
    field :pub_date, :date
    field :price, :decimal
    field :quantity, :integer
    field :img, :binary

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :author, :isbn, :pub_date, :price, :quantity, :editor, :img])
    |> validate_required([:title, :author, :isbn, :pub_date, :price, :quantity, :editor])
  end
end
