defmodule Bookstore.People do
  @moduledoc """
  The People context.
  """

  import Ecto.Query, warn: false
  alias Bookstore.Repo

  alias Bookstore.People.Author

  @doc """
  Returns the list of authors.

  ## Examples

      iex> list_authors()
      [%Author{}, ...]

  """
  def list_authors do
    Repo.all(Author)
  end

  @doc """
  Gets a single author.

  Raises `Ecto.NoResultsError` if the Author does not exist.

  ## Examples

      iex> get_author!(123)
      %Author{}

      iex> get_author!(456)
      ** (Ecto.NoResultsError)

  """
  def get_author!(id), do: Repo.get!(Author, id)

  @doc """
  Creates a author.

  ## Examples

      iex> create_author(%{field: value})
      {:ok, %Author{}}

      iex> create_author(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_author(attrs \\ %{}) do
    %Author{}
    |> Author.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a author.

  ## Examples

      iex> update_author(author, %{field: new_value})
      {:ok, %Author{}}

      iex> update_author(author, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_author(%Author{} = author, attrs) do
    author
    |> Author.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a author.

  ## Examples

      iex> delete_author(author)
      {:ok, %Author{}}

      iex> delete_author(author)
      {:error, %Ecto.Changeset{}}

  """
  def delete_author(%Author{} = author) do
    Repo.delete(author)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking author changes.

  ## Examples

      iex> change_author(author)
      %Ecto.Changeset{data: %Author{}}

  """
  def change_author(%Author{} = author, attrs \\ %{}) do
    Author.changeset(author, attrs)
  end

  @doc """
  Returns the list of authors by id list
  """
  def list_authors_by_id(nil), do: []

  def list_authors_by_id(authors_ids) do
    Repo.all(from a in Author, where: a.id in ^authors_ids)
  end

  defp parse_ids(nil), do: nil

  defp parse_ids(id_list) when is_list(id_list) do
    id_list
    |> Enum.map(&String.to_integer(&1))
  end

  def get_authors_from_attrs(%{authors: authors}), do: authors

  def get_authors_from_attrs(%{"authors_ids" => authors_ids}) do
    parse_ids(authors_ids)
    |> list_authors_by_id()
  end

  def get_authors_from_attrs(%{authors_ids: authors_ids}) do
    parse_ids(authors_ids)
    |> list_authors_by_id()
  end

  def get_authors_from_attrs(_), do: nil
end
