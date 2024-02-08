defmodule Bookstore.Repo.Migrations.CreateBookCategories do
  use Ecto.Migration

  @moduledoc """
  Create join table for many to many references between books and categories
  """
  def change do
    create table(:book_categories, primary_key: false) do
      add :book_id, references(:books, on_delete: :delete_all)
      add :category_id, references(:categories, on_delete: :delete_all)
    end

    create index(:book_categories, [:book_id])
    create unique_index(:book_categories, [:category_id, :book_id])
  end
end
