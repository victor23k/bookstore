defmodule BookstoreWeb.BookLive.Index do
  use BookstoreWeb, :live_view

  alias Bookstore.Catalog
  alias Bookstore.Catalog.Book

  embed_templates "/*"

  @impl true
  def mount(_, _, socket) do
    {:ok,
     socket
     |> assign(page: 1, per_page: 10)
     |> paginate_books(1)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    book = Catalog.get_book!(id)

    socket
    |> assign(:page_title, "Edit Book")
    |> assign(:book, book)
    |> assign(:changeset, Catalog.change_book(book))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Book")
    |> assign(:book, %Book{})
    |> assign(:changeset, %Book{} |> Catalog.change_book())
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Books")
    |> assign(:book, nil)
    |> assign(:changeset, %Book{} |> Catalog.change_book())
  end

  defp paginate_books(socket, new_page) when new_page >= 1 do
    %{per_page: per_page, page: cur_page} = socket.assigns
    books = Catalog.list_books_page(per_page, (new_page - 1) * per_page)

    {books, at, limit} =
      if new_page >= cur_page do
        {books, -1, per_page * 3 * -1}
      else
        {Enum.reverse(books), 0, per_page * 3}
      end

    case books do
      [] ->
        assign(socket, end_of_timeline?: at == -1)

      [_ | _] = books ->
        socket
        |> assign(end_of_timeline?: false)
        |> assign(:page, new_page)
        |> stream(:books, books, at: at, limit: limit)
    end
  end

  @impl true
  def handle_event("next-page", _, socket) do
    {:noreply, paginate_books(socket, socket.assigns.page + 1)}
  end

  def handle_event("prev-page", %{"_overran" => true}, socket) do
    {:noreply, paginate_books(socket, 1)}
  end

  def handle_event("prev-page", _, socket) do
    if socket.assigns.page > 1 do
      {:noreply, paginate_books(socket, socket.assigns.page - 1)}
    else
      {:noreply, socket}
    end
  end

  def handle_event("delete", %{"id" => book_id}, socket) do
    Catalog.delete_book(book_id)
    {:noreply, paginate_books(socket, socket.assigns.page)}
  end
end
