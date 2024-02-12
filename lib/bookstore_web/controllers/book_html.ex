defmodule BookstoreWeb.BookHTML do
  use BookstoreWeb, :html

  embed_templates "book_html/*"

  @doc """
  Renders a book form.
  """
  attr :changeset, BookstoreWeb.Catalog.Book.Changeset, required: true
  attr :action, :string, required: true

  def book_form(assigns)

  def category_opts(changeset) do
    existing_ids =
      changeset
      |> Ecto.Changeset.get_change(:categories, [])
      |> Enum.map(& &1.data.id)

    for category <- Bookstore.Catalog.list_categories(),
        do: [key: category.title, value: category.id, selected: category.id in existing_ids]
  end
end
