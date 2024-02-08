defmodule BookstoreWeb.BooksController do
  use BookstoreWeb, :controller

  def show(conn, %{"title" => title}) do
    render(conn, :show_book, title: title)
  end

  def index(conn, _params) do
    render(conn, :index)
  end
end
