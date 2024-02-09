defmodule Bookstore.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :title, :string
      add :parent_id, references(:categories)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:categories, [:title])
  end
end
