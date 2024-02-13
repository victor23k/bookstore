defmodule Bookstore.Repo.Migrations.CreateBooksAuthors do
  use Ecto.Migration

  @moduledoc """
  Create join table for many to many references between books and authors
  """
  def change do
    create table(:books_authors, primary_key: false) do
      add :book_id, references(:books, on_delete: :delete_all)
      add :author_id, references(:authors, on_delete: :delete_all)
    end

    create index(:books_authors, [:book_id])
    create unique_index(:books_authors, [:author_id, :book_id])
  end
end
