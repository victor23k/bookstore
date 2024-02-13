defmodule BookstoreWeb.AuthorLive.Index do
  use BookstoreWeb, :live_view

  alias Bookstore.People
  alias Bookstore.People.Author

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :authors, People.list_authors())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Author")
    |> assign(:author, People.get_author!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Author")
    |> assign(:author, %Author{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Authors")
    |> assign(:author, nil)
  end

  @impl true
  def handle_info({BookstoreWeb.AuthorLive.FormComponent, {:saved, author}}, socket) do
    {:noreply, stream_insert(socket, :authors, author)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    author = People.get_author!(id)
    {:ok, _} = People.delete_author(author)

    {:noreply, stream_delete(socket, :authors, author)}
  end
end
