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
for [id, title, parent_id] <-
      [
        [1, "Non-fiction", nil],
        [2, "Travel", 1],
        [3, "Biography", 1],
        [4, "Memoir", 1],
        [5, "Self-help", 1],
        [6, "Science", 1],
        [7, "Psychology", 6],
        [8, "Philosophy", 6],
        [9, "Cooking", 1],
        [10, "Food & Drink", 9],
        [11, "Health & Fitness", 9],
        [12, "History", 1],
        [13, "Ancient History", 12],
        [14, "Modern History", 12],
        [15, "Art & Photography", 1],
        [16, "Music", 15],
        [17, "Photography", 15],
        [18, "Fiction", nil],
        [19, "Fantasy", 18],
        [20, "Science Fiction", 18],
        [21, "Mystery", 18],
        [22, "Thriller", 18],
        [23, "Historical Fiction", 18],
        [24, "Romance", 18],
        [25, "Horror", 18],
        [26, "Young Adult", 18],
        [27, "Children's", 18],
        [28, "Poetry", 18],
        [29, "Drama", 18],
        [30, "Classic", 18]
      ] do
  {:ok, _} = Bookstore.Catalog.create_category(%{id: id, title: title, parent_id: parent_id})
end

for attrs <- [
      %{
        title: "The Hobbit",
        author: "J.R.R. Tolkien",
        isbn: "978-0-618-00221-4",
        price: 15.99,
        pub_date: "1937-09-21",
        quantity: 5,
        img: nil,
        editor: "Houghton Mifflin Harcourt",
        categories: Bookstore.Catalog.list_categories_by_title(["Fantasy"])
      },
      %{
        title: "Dune",
        author: "Frank Herbert",
        isbn: "978-0-441-17271-9",
        price: 12.75,
        pub_date: "1965-06-01",
        quantity: 8,
        img: nil,
        editor: "Ace Books",
        categories: Bookstore.Catalog.list_categories_by_title(["Science Fiction"])
      },
      %{
        title: "Murder on the Orient Express",
        author: "Agatha Christie",
        isbn: "978-0-06-269366-2",
        price: 9.99,
        pub_date: "1934-01-01",
        quantity: 3,
        img: nil,
        editor: "William Collins, Sons",
        categories: Bookstore.Catalog.list_categories_by_title(["Mystery"])
      },
      %{
        title: "The Da Vinci Code",
        author: "Dan Brown",
        isbn: "978-0-385-50420-5",
        price: 11.25,
        pub_date: "2003-03-18",
        quantity: 12,
        img: nil,
        editor: "Doubleday",
        categories: Bookstore.Catalog.list_categories_by_title(["Thriller"])
      },
      %{
        title: "The Nightingale",
        author: "Kristin Hannah",
        isbn: "978-1-250-01099-6",
        price: 14.50,
        pub_date: "2015-02-03",
        quantity: 6,
        img: nil,
        editor: "St. Martin's Press",
        categories: Bookstore.Catalog.list_categories_by_title(["Historical Fiction"])
      },
      %{
        title: "Pride and Prejudice",
        author: "Jane Austen",
        isbn: "978-0-486-41236-2",
        price: 8.99,
        pub_date: "1813-01-28",
        quantity: 10,
        img: nil,
        editor: "T. Egerton, Whitehall",
        categories: Bookstore.Catalog.list_categories_by_title(["Romance"])
      },
      %{
        title: "Dracula",
        author: "Bram Stoker",
        isbn: "978-1-59308-347-4",
        price: 7.95,
        pub_date: "1897-05-26",
        quantity: 4,
        img: nil,
        editor: "Archibald Constable and Company",
        categories: Bookstore.Catalog.list_categories_by_title(["Horror"])
      },
      %{
        title: "Sapiens: A Brief History of Humankind",
        author: "Yuval Noah Harari",
        isbn: "978-0-06-231609-7",
        price: 20.00,
        pub_date: "2011-02-10",
        quantity: 7,
        img: nil,
        editor: "Harper",
        categories: Bookstore.Catalog.list_categories_by_title(["Non-fiction", "History"])
      },
      %{
        title: "Steve Jobs",
        author: "Walter Isaacson",
        isbn: "978-1-4516-4853-9",
        price: 13.75,
        pub_date: "2011-10-24",
        quantity: 2,
        img: nil,
        editor: "Simon & Schuster",
        categories: Bookstore.Catalog.list_categories_by_title(["Biography", "Business"])
      },
      %{
        title: "Educated",
        author: "Tara Westover",
        isbn: "978-0-399-59050-4",
        price: 16.99,
        pub_date: "2018-02-20",
        quantity: 9,
        img: nil,
        editor: "Random House",
        categories: Bookstore.Catalog.list_categories_by_title(["Memoir"])
      },
      %{
        title: "The 7 Habits of Highly Effective People",
        author: "Stephen R. Covey",
        isbn: "978-1-4391-0153-3",
        price: 11.49,
        pub_date: "1989-08-15",
        quantity: 5,
        img: nil,
        editor: "Free Press",
        categories: Bookstore.Catalog.list_categories_by_title(["Self-help"])
      },
      %{
        title: "To Kill a Mockingbird",
        author: "Harper Lee",
        isbn: "978-0-06-112008-4",
        price: 9.25,
        pub_date: "1960-07-11",
        quantity: 8,
        img: nil,
        editor: "J.B. Lippincott & Co.",
        categories: Bookstore.Catalog.list_categories_by_title(["Classic", "Fiction"])
      },
      %{
        title: "Harry Potter and the Sorcerer's Stone",
        author: "J.K. Rowling",
        isbn: "978-0-7475-3269-6",
        price: 14.95,
        pub_date: "1997-06-26",
        quantity: 3,
        img: nil,
        editor: "Bloomsbury",
        categories: Bookstore.Catalog.list_categories_by_title(["Fantasy", "Young Adult"])
      },
      %{
        title: "Goodnight Moon",
        author: "Margaret Wise Brown",
        isbn: "978-0-06-077585-8",
        price: 6.99,
        pub_date: "1947-09-03",
        quantity: 6,
        img: nil,
        editor: "Harper & Brothers",
        categories: Bookstore.Catalog.list_categories_by_title(["Children's"])
      },
      %{
        title: "Milk and Honey",
        author: "Rupi Kaur",
        isbn: "978-1-4494-9825-6",
        price: 10.99,
        pub_date: "2014-11-04",
        quantity: 4,
        img: nil,
        editor: "Andrews McMeel Publishing",
        categories: Bookstore.Catalog.list_categories_by_title(["Poetry"])
      },
      %{
        title: "Cosmos",
        author: "Carl Sagan",
        isbn: "978-0-345-34681-9",
        price: 18.50,
        pub_date: "1980-10-01",
        quantity: 7,
        img: nil,
        editor: "Random House",
        categories: Bookstore.Catalog.list_categories_by_title(["Science"])
      },
      %{
        title: "Thinking, Fast and Slow",
        author: "Daniel Kahneman",
        isbn: "978-0-374-27563-1",
        price: 14.25,
        pub_date: "2011-10-25",
        quantity: 2,
        img: nil,
        editor: "Farrar, Straus and Giroux",
        categories: Bookstore.Catalog.list_categories_by_title(["Psychology"])
      },
      %{
        title: "The Joy of Cooking",
        author: "Irma S. Rombauer",
        isbn: "978-0-452-25665-2",
        price: 22.99,
        pub_date: "1931-01-01",
        quantity: 9,
        img: nil,
        editor: "Bobbs-Merrill Company",
        categories: Bookstore.Catalog.list_categories_by_title(["Cooking"])
      },
      %{
        title: "The Alchemist",
        author: "Paulo Coelho",
        isbn: "978-0-06-112241-5",
        price: 11.99,
        pub_date: "1988-01-01",
        quantity: 3,
        img: nil,
        editor: "HarperOne",
        categories: Bookstore.Catalog.list_categories_by_title(["Fiction"])
      },
      %{
        title: "Into the Wild",
        author: "Jon Krakauer",
        isbn: "978-0-385-49476-2",
        price: 13.49,
        pub_date: "1996-01-01",
        quantity: 6,
        img: nil,
        editor: "Villard Books",
        categories: Bookstore.Catalog.list_categories_by_title(["Travel", "Adventure"])
      },
      %{
        title: "1984",
        author: "George Orwell",
        isbn: "978-0-452-28423-4",
        price: 9.99,
        pub_date: "1949-06-08",
        quantity: 6,
        img: nil,
        editor: "Secker & Warburg",
        categories: Bookstore.Catalog.list_categories_by_title(["Dystopian", "Classic"])
      },
      %{
        title: "The Catcher in the Rye",
        author: "J.D. Salinger",
        isbn: "978-0-316-76948-4",
        price: 8.50,
        pub_date: "1951-07-16",
        quantity: 3,
        img: nil,
        editor: "Little, Brown and Company",
        categories: Bookstore.Catalog.list_categories_by_title(["Coming of Age", "Classic"])
      },
      %{
        title: "The Great Gatsby",
        author: "F. Scott Fitzgerald",
        isbn: "978-0-7432-7356-5",
        price: 10.25,
        pub_date: "1925-04-10",
        quantity: 5,
        img: nil,
        editor: "Charles Scribner's Sons",
        categories: Bookstore.Catalog.list_categories_by_title(["Classic", "Literary Fiction"])
      },
      %{
        title: "Lord of the Flies",
        author: "William Golding",
        isbn: "978-0-571-05686-5",
        price: 11.75,
        pub_date: "1954-09-17",
        quantity: 7,
        img: nil,
        editor: "Faber and Faber",
        categories: Bookstore.Catalog.list_categories_by_title(["Allegory", "Classic"])
      },
      %{
        title: "Brave New World",
        author: "Aldous Huxley",
        isbn: "978-0-06-085052-4",
        price: 12.99,
        pub_date: "1932-01-01",
        quantity: 4,
        img: nil,
        editor: "Chatto & Windus",
        categories: Bookstore.Catalog.list_categories_by_title(["Dystopian", "Classic"])
      },
      %{
        title: "The Picture of Dorian Gray",
        author: "Oscar Wilde",
        isbn: "978-1-4926-4561-2",
        price: 7.25,
        pub_date: "1890-07-01",
        quantity: 8,
        img: nil,
        editor: "Lippincott's Monthly Magazine",
        categories: Bookstore.Catalog.list_categories_by_title(["Gothic", "Classic"])
      },
      %{
        title: "Fahrenheit 451",
        author: "Ray Bradbury",
        isbn: "978-1-4516-7331-9",
        price: 10.99,
        pub_date: "1953-10-19",
        quantity: 6,
        img: nil,
        editor: "Ballantine Books",
        categories: Bookstore.Catalog.list_categories_by_title(["Dystopian", "Science Fiction"])
      },
      %{
        title: "The Road",
        author: "Cormac McCarthy",
        isbn: "978-0-307-38789-9",
        price: 13.49,
        pub_date: "2006-09-26",
        quantity: 3,
        img: nil,
        editor: "Knopf",
        categories:
          Bookstore.Catalog.list_categories_by_title(["Post-apocalyptic", "Literary Fiction"])
      },
      %{
        title: "The Kite Runner",
        author: "Khaled Hosseini",
        isbn: "978-1-59448-000-3",
        price: 11.49,
        pub_date: "2003-05-29",
        quantity: 5,
        img: nil,
        editor: "Riverhead Books",
        categories: Bookstore.Catalog.list_categories_by_title(["Historical", "Literary Fiction"])
      },
      %{
        title: "The Road Less Traveled",
        author: "M. Scott Peck",
        isbn: "978-0-684-84363-4",
        price: 12.75,
        pub_date: "1978-06-23",
        quantity: 4,
        img: nil,
        editor: "Simon & Schuster",
        categories: Bookstore.Catalog.list_categories_by_title(["Self-help", "Psychology"])
      },
      %{
        title: "The Silent Patient",
        author: "Alex Michaelides",
        isbn: "978-1-250-30169-7",
        price: 14.99,
        pub_date: "2019-02-05",
        quantity: 7,
        img: nil,
        editor: "Celadon Books",
        categories:
          Bookstore.Catalog.list_categories_by_title(["Psychological Thriller", "Mystery"])
      },
      %{
        title: "The Martian",
        author: "Andy Weir",
        isbn: "978-0-8041-3902-1",
        price: 13.25,
        pub_date: "2011-09-27",
        quantity: 6,
        img: nil,
        editor: "Crown Publishing Group",
        categories: Bookstore.Catalog.list_categories_by_title(["Science Fiction", "Survival"])
      },
      %{
        title: "Gone Girl",
        author: "Gillian Flynn",
        isbn: "978-0-307-58837-1",
        price: 9.99,
        pub_date: "2012-06-05",
        quantity: 9,
        img: nil,
        editor: "Crown Publishing Group",
        categories: Bookstore.Catalog.list_categories_by_title(["Mystery", "Thriller"])
      },
      %{
        title: "The Hunger Games",
        author: "Suzanne Collins",
        isbn: "978-0-439-02348-1",
        price: 12.99,
        pub_date: "2008-09-14",
        quantity: 8,
        img: nil,
        editor: "Scholastic",
        categories: Bookstore.Catalog.list_categories_by_title(["Young Adult", "Dystopian"])
      },
      %{
        title: "The Help",
        author: "Kathryn Stockett",
        isbn: "978-0-399-15534-5",
        price: 11.25,
        pub_date: "2009-02-10",
        quantity: 5,
        img: nil,
        editor: "Amy Einhorn Books",
        categories: Bookstore.Catalog.list_categories_by_title(["Historical", "Fiction"])
      },
      %{
        title: "Cien años de soledad",
        author: "Gabriel García Márquez",
        isbn: "978-84-376-0494-7",
        price: 14.99,
        pub_date: "1967-05-30",
        quantity: 5,
        img: nil,
        editor: "Editorial Sudamericana",
        categories:
          Bookstore.Catalog.list_categories_by_title(["Magic Realism", "Literary Fiction"])
      },
      %{
        title: "Don Quijote de la Mancha",
        author: "Miguel de Cervantes",
        isbn: "978-84-670-0023-3",
        price: 12.75,
        pub_date: "1605-01-01",
        quantity: 8,
        img: nil,
        editor: "Juan de la Cuesta",
        categories: Bookstore.Catalog.list_categories_by_title(["Classic", "Adventure"])
      },
      %{
        title: "La sombra del viento",
        author: "Carlos Ruiz Zafón",
        isbn: "978-84-322-1506-6",
        price: 11.49,
        pub_date: "2001-04-01",
        quantity: 6,
        img: nil,
        editor: "Editorial Planeta",
        categories: Bookstore.Catalog.list_categories_by_title(["Mystery", "Historical Fiction"])
      },
      %{
        title: "Rayuela",
        author: "Julio Cortázar",
        isbn: "978-84-204-0225-2",
        price: 9.99,
        pub_date: "1963-07-28",
        quantity: 7,
        img: nil,
        editor: "Editorial Sudamericana",
        categories:
          Bookstore.Catalog.list_categories_by_title(["Experimental", "Literary Fiction"])
      },
      %{
        title: "La casa de los espíritus",
        author: "Isabel Allende",
        isbn: "978-84-663-1324-4",
        price: 13.25,
        pub_date: "1982-06-01",
        quantity: 4,
        img: nil,
        editor: "Plaza & Janés",
        categories:
          Bookstore.Catalog.list_categories_by_title(["Magical Realism", "Literary Fiction"])
      },
      %{
        title: "El amor en los tiempos del cólera",
        author: "Gabriel García Márquez",
        isbn: "978-84-376-0194-6",
        price: 11.99,
        pub_date: "1985-05-15",
        quantity: 6,
        img: nil,
        editor: "Editorial Sudamericana",
        categories: Bookstore.Catalog.list_categories_by_title(["Romance", "Literary Fiction"])
      },
      %{
        title: "Como agua para chocolate",
        author: "Laura Esquivel",
        isbn: "978-84-8306-030-0",
        price: 10.50,
        pub_date: "1989-01-01",
        quantity: 3,
        img: nil,
        editor: "Editorial Diana",
        categories: Bookstore.Catalog.list_categories_by_title(["Magic Realism", "Romance"])
      },
      %{
        title: "El laberinto de los espíritus",
        author: "Carlos Ruiz Zafón",
        isbn: "978-84-204-2703-4",
        price: 14.75,
        pub_date: "2016-11-17",
        quantity: 5,
        img: nil,
        editor: "Editorial Planeta",
        categories: Bookstore.Catalog.list_categories_by_title(["Mystery", "Historical Fiction"])
      },
      %{
        title: "La ciudad y los perros",
        author: "Mario Vargas Llosa",
        isbn: "978-84-9759-278-1",
        price: 12.99,
        pub_date: "1963-10-01",
        quantity: 7,
        img: nil,
        editor: "Editorial Losada",
        categories:
          Bookstore.Catalog.list_categories_by_title(["Literary Fiction", "Coming of Age"])
      },
      %{
        title: "Los renglones torcidos de Dios",
        author: "Torcuato Luca de Tena",
        isbn: "978-84-663-0446-5",
        price: 9.25,
        pub_date: "1979-09-30",
        quantity: 4,
        img: nil,
        editor: "Plaza & Janés",
        categories:
          Bookstore.Catalog.list_categories_by_title(["Mystery", "Psychological Thriller"])
      }
    ] do
  {:ok, _} = Bookstore.Catalog.create_book(attrs)
end
