# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Bookstore.Repo.insert!(%Bookstore.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
for title <- [
      "Fantasy",
      "Science Fiction",
      "Mystery",
      "Thriller",
      "Historical Fiction",
      "Romance",
      "Horror",
      "Non-fiction",
      "Biography",
      "Memoir",
      "Self-help",
      "Young Adult",
      "Children's",
      "Poetry",
      "Science",
      "Psychology",
      "Philosophy",
      "Cooking",
      "Travel",
      "Art"
    ] do
  {:ok, _} = Bookstore.Catalog.create_category(%{title: title})
end
