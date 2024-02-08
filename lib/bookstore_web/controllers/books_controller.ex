defmodule BookstoreWeb.BooksController do
  use BookstoreWeb, :controller

  def show(conn, %{"id" => id}) do
    render(conn, :show_book, id: id)
  end

  def index(conn, _params) do
    render(conn, :index)
  end
end
