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

for book <- [
  %{title: "The Hobbit", author: "J.R.R. Tolkien", isbn: "978-0-618-00221-4", price: 15.99, pub_date: "1937-09-21", quantity: 5, img: nil, categories: ["Fantasy"], editor: "Houghton Mifflin Harcourt"},
  %{title: "Dune", author: "Frank Herbert", isbn: "978-0-441-17271-9", price: 12.75, pub_date: "1965-06-01", quantity: 8, img: nil, categories: ["Science Fiction"], editor: "Ace Books"},
  %{title: "Murder on the Orient Express", author: "Agatha Christie", isbn: "978-0-06-269366-2", price: 9.99, pub_date: "1934-01-01", quantity: 3, img: nil, categories: ["Mystery"], editor: "William Collins, Sons"},
  %{title: "The Da Vinci Code", author: "Dan Brown", isbn: "978-0-385-50420-5", price: 11.25, pub_date: "2003-03-18", quantity: 12, img: nil, categories: ["Thriller"], editor: "Doubleday"},
  %{title: "The Nightingale", author: "Kristin Hannah", isbn: "978-1-250-01099-6", price: 14.50, pub_date: "2015-02-03", quantity: 6, img: nil, categories: ["Historical Fiction"], editor: "St. Martin's Press"},
  %{title: "Pride and Prejudice", author: "Jane Austen", isbn: "978-0-486-41236-2", price: 8.99, pub_date: "1813-01-28", quantity: 10, img: nil, categories: ["Romance"], editor: "T. Egerton, Whitehall"},
  %{title: "Dracula", author: "Bram Stoker", isbn: "978-1-59308-347-4", price: 7.95, pub_date: "1897-05-26", quantity: 4, img: nil, categories: ["Horror"], editor: "Archibald Constable and Company"},
  %{title: "Sapiens: A Brief History of Humankind", author: "Yuval Noah Harari", isbn: "978-0-06-231609-7", price: 20.00, pub_date: "2011-02-10", quantity: 7, img: nil, categories: ["Non-fiction", "History"], editor: "Harper"},
  %{title: "Steve Jobs", author: "Walter Isaacson", isbn: "978-1-4516-4853-9", price: 13.75, pub_date: "2011-10-24", quantity: 2, img: nil, categories: ["Biography", "Business"], editor: "Simon & Schuster"},
  %{title: "Educated", author: "Tara Westover", isbn: "978-0-399-59050-4", price: 16.99, pub_date: "2018-02-20", quantity: 9, img: nil, categories: ["Memoir"], editor: "Random House"},
  %{title: "The 7 Habits of Highly Effective People", author: "Stephen R. Covey", isbn: "978-1-4391-0153-3", price: 11.49, pub_date: "1989-08-15", quantity: 5, img: nil, categories: ["Self-help"], editor: "Free Press"},
  %{title: "To Kill a Mockingbird", author: "Harper Lee", isbn: "978-0-06-112008-4", price: 9.25, pub_date: "1960-07-11", quantity: 8, img: nil, categories: ["Classic", "Fiction"], editor: "J.B. Lippincott & Co."},
  %{title: "Harry Potter and the Sorcerer's Stone", author: "J.K. Rowling", isbn: "978-0-7475-3269-6", price: 14.95, pub_date: "1997-06-26", quantity: 3, img: nil, categories: ["Fantasy", "Young Adult"], editor: "Bloomsbury"},
  %{title: "Goodnight Moon", author: "Margaret Wise Brown", isbn: "978-0-06-077585-8", price: 6.99, pub_date: "1947-09-03", quantity: 6, img: nil, categories: ["Children's"], editor: "Harper & Brothers"},
  %{title: "Milk and Honey", author: "Rupi Kaur", isbn: "978-1-4494-9825-6", price: 10.99, pub_date: "2014-11-04", quantity: 4, img: nil, categories: ["Poetry"], editor: "Andrews McMeel Publishing"},
  %{title: "Cosmos", author: "Carl Sagan", isbn: "978-0-345-34681-9", price: 18.50, pub_date: "1980-10-01", quantity: 7, img: nil, categories: ["Science"], editor: "Random House"},
  %{title: "Thinking, Fast and Slow", author: "Daniel Kahneman", isbn: "978-0-374-27563-1", price: 14.25, pub_date: "2011-10-25", quantity: 2, img: nil, categories: ["Psychology"], editor: "Farrar, Straus and Giroux"},
  %{title: "Meditations", author: "Marcus Aurelius", isbn: "978-0-140-44523-5", price: 7.75, pub_date: "161-180", quantity: 5, img: nil, categories: ["Philosophy"], editor: "Various"},
  %{title: "The Joy of Cooking", author: "Irma S. Rombauer", isbn: "978-0-452-25665-2", price: 22.99, pub_date: "1931-01-01", quantity: 9, img: nil, categories: ["Cooking"], editor: "Bobbs-Merrill Company"},
  %{title: "The Alchemist", author: "Paulo Coelho", isbn: "978-0-06-112241-5", price: 11.99, pub_date: "1988-01-01", quantity: 3, img: nil, categories: ["Fiction"], editor: "HarperOne"},
  %{title: "Into the Wild", author: "Jon Krakauer", isbn: "978-0-385-49476-2", price: 13.49, pub_date: "1996-01-01", quantity: 6, img: nil, categories: ["Travel", "Adventure"], editor: "Villard Books"}
] do
  {:ok, _} = Bookstore.Catalog.create_book(book)
end
