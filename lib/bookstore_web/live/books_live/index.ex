defmodule BookstoreWeb.BooksLive do
  use BookstoreWeb, :live_view
  alias Bookstore.Catalog

  def mount(_, _, socket) do
    {:ok,
     socket
     |> assign(page: 1, per_page: 5)
     |> paginate_books(1)}
  end

  def render(assigns) do
    ~H"""
    <ul
      id="books"
      phx-update="stream"
      phx-viewport-top={@page > 1 && "prev-page"}
      phx-viewport-bottom={!@end_of_timeline? && "next-page"}
      phx-page-loading
      class={[
        if(@end_of_timeline?, do: "pb-10", else: "pb-[calc(200vh)]"),
        if(@page == 1, do: "pt-10", else: "pt-[calc(200vh)]")
      ]}
    >
      <li :for={{id, book} <- @streams.books}
      id={id}>
      <.list>
        <:item title="Title"><%= book.title %></:item>
        <:item title="Author"><%= book.author %></:item>
        <:item title="ISBN"><%= book.isbn %></:item>
        <:item title="Publication date"><%= book.pub_date %></:item>
        <:item title="Price"><%= book.price %></:item>
        <:item title="Quantity"><%= book.quantity %></:item>
        <:item title="Editor"><%= book.editor %></:item>
        <:item title="Image"><%= book.img %></:item>
        <:item title="Categories"><%= Enum.map(book.categories, & &1.title) %></:item>
      </.list>
      </li>
    </ul>
    <div :if={@end_of_timeline?} class="mt-5 text-[50px] text-center">
      🎉 You made it to the beginning of time 🎉
    </div>
    """
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
end
