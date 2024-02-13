defmodule BookstoreWeb.AuthorLive.FormComponent do
  use BookstoreWeb, :live_component

  alias Bookstore.People

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage author records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="author-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:surname]} type="text" label="Surname" />
        <.input field={@form[:born]} type="date" label="Born" />
        <.input field={@form[:dead]} type="date" label="Dead" />
        <.input field={@form[:birth_place]} type="text" label="Birth place" />
        <.input field={@form[:death_place]} type="text" label="Death place" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Author</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{author: author} = assigns, socket) do
    changeset = People.change_author(author)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"author" => author_params}, socket) do
    changeset =
      socket.assigns.author
      |> People.change_author(author_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"author" => author_params}, socket) do
    save_author(socket, socket.assigns.action, author_params)
  end

  defp save_author(socket, :edit, author_params) do
    case People.update_author(socket.assigns.author, author_params) do
      {:ok, author} ->
        notify_parent({:saved, author})

        {:noreply,
         socket
         |> put_flash(:info, "Author updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_author(socket, :new, author_params) do
    case People.create_author(author_params) do
      {:ok, author} ->
        notify_parent({:saved, author})

        {:noreply,
         socket
         |> put_flash(:info, "Author created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
