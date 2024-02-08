defmodule BookstoreWeb.BooksHTML do
  use BookstoreWeb, :html

  embed_templates "books_html/*"

  attr :id, :integer, required: true

  def show_book(assigns) do
    ~H"""
    <p>Book: <%= @id %></p>
    """
  end
end
