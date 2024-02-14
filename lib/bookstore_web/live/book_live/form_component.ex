defmodule BookstoreWeb.BookLive.FormComponent do
  alias Bookstore.People
  use BookstoreWeb, :live_component

  alias Bookstore.Catalog

  @impl true
  def mount(socket) do
    {:ok,
     socket
     |> assign(:uploaded_files, [])
     |> allow_upload(:cover, accept: ~w(.jpg .jpeg .png .webp), max_entries: 1)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage book records in your database.</:subtitle>
      </.header>
      <.simple_form
        for={@form}
        id="book-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:title]} type="text" label="Title" />
        <.input
          field={@form[:authors_ids]}
          type="select"
          label="Authors"
          multiple={true}
          options={author_opts(@changeset.data.authors)}
        />
        <.input field={@form[:isbn]} type="text" label="ISBN" />
        <.input field={@form[:pub_date]} type="date" label="Publication date" />
        <.input field={@form[:price]} type="number" label="Price" step="any" />
        <.input field={@form[:quantity]} type="number" label="Quantity" />
        <.input field={@form[:editor]} type="text" label="Editor" />
        <.input field={@form[:img]} type="text" label="Cover" hidden />

        <section phx-drop-target={@uploads.cover.ref}>
          <img height="260" width="125" src={@changeset.data.img} />
          <.live_file_input upload={@uploads.cover} />
          <%= for entry <- @uploads.cover.entries do %>
            <article class="upload-entry">
              <figure>
                <.live_img_preview entry={entry} />
                <figcaption><%= entry.client_name %></figcaption>
              </figure>

              <%!-- entry.progress will update automatically for in-flight entries --%>
              <progress value={entry.progress} max="100"><%= entry.progress %>%</progress>

              <%!-- a regular click event whose handler will invoke Phoenix.LiveView.cancel_upload/3 --%>
              <button
                type="button"
                phx-click="cancel-upload"
                phx-value-ref={entry.ref}
                aria-label="cancel"
              >
                &times;
              </button>
            </article>
          <% end %>
        </section>

        <.input
          field={@form[:categories_ids]}
          type="select"
          label="Category"
          multiple={true}
          options={category_opts(@changeset.data.categories)}
        />
        <:actions>
          <.button phx-disable-with="Saving...">Save Book</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{book: book} = assigns, socket) do
    changeset = Catalog.change_book(book)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"book" => book_params}, socket) do
    changeset =
      socket.assigns.book
      |> Catalog.change_book(book_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"book" => book_params}, socket) do
    uploaded_files =
      consume_uploaded_entries(socket, :cover, fn %{path: path}, _entry ->
        dest =
          Path.join(Application.app_dir(:bookstore, "priv/static/uploads"), Path.basename(path))

        File.cp!(path, dest)
        {:ok, ~p"/uploads/#{Path.basename(dest)}"}
      end)

    book_params = Map.put(book_params, "img", image_to_save(book_params, uploaded_files))

    update(socket, :uploaded_files, &(&1 ++ uploaded_files))
    |> save_book(socket.assigns.action, book_params)
  end

  @impl true
  def handle_event("cancel-upload", %{"ref" => ref}, socket) do
    {:noreply, cancel_upload(socket, :cover, ref)}
  end

  def category_opts(categories) do
    existing_ids =
      categories
      |> Enum.map(& &1.id)

    for category <- Bookstore.Catalog.list_categories(),
        do: [key: category.title, value: category.id, selected: category.id in existing_ids]
  end

  def author_opts(authors) do
    existing_ids =
      authors
      |> Enum.map(& &1.id)

    for author <- People.list_authors(),
        do: [key: author.surname, value: author.id, selected: author.id in existing_ids]
  end

  def error_to_string(:too_large), do: "Too large"
  def error_to_string(:not_accepted), do: "You have selected an unacceptable file type"

  defp save_book(socket, :edit, book_params) do
    case Catalog.update_book(socket.assigns.book, book_params) do
      {:ok, book} ->
        notify_parent({:saved, book})

        {:noreply,
         socket
         |> put_flash(:info, "Book updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_book(socket, :new, book_params) do
    case Catalog.create_book(book_params) do
      {:ok, book} ->
        notify_parent({:saved, book})

        {:noreply,
         socket
         |> put_flash(:info, "Book created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})

  defp image_to_save(book_params, []), do: Map.get(book_params, "img", "")
  defp image_to_save(_, [uploaded_image]), do: uploaded_image
end
