defmodule Bookstore.Catalog do
  @moduledoc """
  The Catalog context.
  """

  import Ecto.Query, warn: false
  alias Bookstore.People
  alias Bookstore.Repo

  alias Bookstore.Catalog.Book

  @doc """
  Returns the list of books.

  ## Examples

      iex> list_books()
      [%Book{}, ...]

  """
  @spec list_books() :: [Book.t()]
  def list_books do
    Repo.all(Book)
    |> Repo.preload(:categories)
    |> Repo.preload(:authors)
  end

  @doc """
  Returns a paginated list of books with a default limit of 5.

  ## Examples

      iex> list_books_page(0)
      [%Book{}, ...]

  """
  @spec list_books_page(pos_integer(), pos_integer()) :: [Book.t()]
  def list_books_page(limit \\ 5, offset) do
    query = from Book, limit: ^limit, offset: ^offset, order_by: :id

    Repo.all(query)
    |> Repo.preload(:categories)
    |> Repo.preload(:authors)
  end

  @doc """
  Gets a single book.

  Raises `Ecto.NoResultsError` if the Book does not exist.

  ## Examples

      iex> get_book!(123)
      %Book{}

      iex> get_book!(456)
      ** (Ecto.NoResultsError)

  """
  @spec get_book!(pos_integer()) :: Book.t()
  def get_book!(id) do
    Repo.get!(Book, id)
    |> Repo.preload(:categories)
    |> Repo.preload(:authors)
  end

  @doc """
  Creates a book.

  ## Examples

      iex> create_book(%{field: value})
      {:ok, %Book{}}

      iex> create_book(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  @spec create_book(map()) :: {:ok, Book.t()} | {:error, Ecto.Changeset.t()}
  def create_book(attrs \\ %{}) do
    %Book{}
    |> change_book(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book.

  ## Examples

      iex> update_book(book, %{field: new_value})
      {:ok, %Book{}}

      iex> update_book(book, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  @spec update_book(Book.t(), map()) :: {:ok, Book.t()} | {:error, Ecto.Changeset.t()}
  def update_book(%Book{} = book, attrs) do
    book
    |> change_book(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a book.

  ## Examples

      iex> delete_book(book)
      {:ok, %Book{}}

      iex> delete_book(book)
      {:error, %Ecto.Changeset{}}

  """
  @spec delete_book(Book.t()) :: {:ok, Book.t()} | {:error, Ecto.Changeset.t()}
  def delete_book(%Book{} = book) do
    Repo.delete(book)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book changes.

  ## Examples

      iex> change_book(book)
      %Ecto.Changeset{data: %Book{}}

  """
  @spec change_book(Book.t(), map()) :: Ecto.Changeset.t()
  def change_book(%Book{} = book, attrs \\ %{}) do
    categories = get_categories_from_attrs(attrs)
    authors = People.get_authors_from_attrs(attrs)

    book
    |> Repo.preload(:categories)
    |> Repo.preload(:authors)
    |> Book.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:categories, categories)
    |> Ecto.Changeset.put_assoc(:authors, authors)
  end

  defp get_categories_from_attrs(%{categories: categories}), do: categories

  defp get_categories_from_attrs(%{"categories_ids" => categories_ids}) do
    parse_ids(categories_ids)
    |> list_categories_by_id()
  end

  defp get_categories_from_attrs(_), do: nil

  defp parse_ids(nil), do: nil

  defp parse_ids(id_list) when is_list(id_list) do
    id_list
    |> Enum.map(&String.to_integer(&1))
  end

  alias Bookstore.Catalog.Category

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  @spec list_categories() :: [Category.t()]
  def list_categories do
    Repo.all(Category)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  @spec get_category!(pos_integer()) :: Category.t()
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  @spec create_category(map()) :: {:ok, Category.t()} | {:error, Ecto.Changeset.t()}
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  @spec update_category(Category.t(), map()) :: {:ok, Category.t()} | {:error, Ecto.Changeset.t()}
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  @spec delete_category(Category.t()) :: {:ok, Category.t()} | {:error, Ecto.Changeset.t()}
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{data: %Category{}}

  """
  @spec change_category(Category.t(), map()) :: Ecto.Changeset.t()
  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end

  @doc """
  Returns the list of categories by id list
  """
  @spec list_categories_by_id(nil | [pos_integer()]) :: [] | [Category.t()]
  def list_categories_by_id(nil), do: []

  def list_categories_by_id(category_ids) do
    Repo.all(from c in Category, where: c.id in ^category_ids)
  end

  @doc """
  Returns the list of categories by title list
  """
  @spec list_categories_by_title(nil | [String.t()]) :: [] | [Category.t()]
  def list_categories_by_title(nil), do: []

  def list_categories_by_title(category_titles) do
    Repo.all(from c in Category, where: c.title in ^category_titles)
  end

  @doc """
  Returns the list of categories ids by title list
  """
  @spec list_categories_ids_by_title(nil | [String.t()]) :: [] | [String.t()]
  def list_categories_ids_by_title(nil), do: []

  def list_categories_ids_by_title(category_titles) do
    Repo.all(from c in Category, where: c.title in ^category_titles, select: c.id)
  end
end
