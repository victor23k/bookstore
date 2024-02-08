defmodule BookstoreWeb.BooksHTML do
  use BookstoreWeb, :html
  
  embed_templates "books_html/*"

  attr :title, :string, required: true

  def show_book(assigns) do
    ~H"""
    <p>Book: <%= @title %></p>
    """
  end
end
