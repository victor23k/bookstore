defmodule Bookstore.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :name, :string
      add :surname, :string
      add :born, :date
      add :dead, :date
      add :birth_place, :string
      add :death_place, :string

      timestamps(type: :utc_datetime)
    end
  end
end
