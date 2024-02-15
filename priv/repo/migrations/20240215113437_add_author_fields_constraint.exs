defmodule Bookstore.Repo.Migrations.AddAuthorFieldsConstraint do
  use Ecto.Migration

  def change do
    create unique_index(:authors, [:name, :surname, :born, :dead, :birth_place, :death_place], name: :full_author_constraint, nulls_distinct: false)
  end
end
