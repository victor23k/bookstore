defmodule Bookstore.Catalog.Category do
  use Ecto.Schema
  import Ecto.Changeset

  @moduledoc """
  Define the schema for the category entity which consists of:
    Title
  """

  schema "categories" do
    field :title, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:title])
    |> validate_required([:title])
    |> unique_constraint(:title)
  end
end
