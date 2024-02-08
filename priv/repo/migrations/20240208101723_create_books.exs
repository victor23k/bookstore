defmodule Bookstore.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :isbn, :string
      add :pub_date, :date
      add :price, :decimal, precision: 15, scale: 6, null: false
      add :quantity, :integer
      add :editor, :string
      add :author, :string
      add :img, :binary

      timestamps(type: :utc_datetime)
    end
  end
end
