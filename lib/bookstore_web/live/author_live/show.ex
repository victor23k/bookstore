defmodule BookstoreWeb.AuthorLive.Show do
  use BookstoreWeb, :live_view

  alias Bookstore.People

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:author, People.get_author!(id))}
  end

  defp page_title(:show), do: "Show Author"
  defp page_title(:edit), do: "Edit Author"
end
