defmodule BookstoreWeb.BookLive.Show do
  use BookstoreWeb, :live_view

  alias Bookstore.Catalog

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    book = Catalog.get_book!(id)

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:book, book)
     |> assign(:changeset, Catalog.change_book(book))}
  end

  defp page_title(:show), do: "Show Book"
  defp page_title(:edit), do: "Edit Book"
end
