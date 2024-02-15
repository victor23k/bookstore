defmodule Bookstore.Repo.Migrations.AddAuthorDatesConstraint do
  use Ecto.Migration

  def change do
    create constraint(:authors, :born_before_dead, check: "born < dead")
  end
end
