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
        [30, "Classic", 18],
        [31, "Magic Realism", 18],
        [32, "Literary Fiction", 18],
        [33, "Adventure", 18],
        [34, "Coming of Age", 18],
        [35, "Psychological Thriller", 18]
      ] do
  {:ok, _} = Bookstore.Catalog.create_category(%{id: id, title: title, parent_id: parent_id})
end

for [id, name, surname, born, dead, birth_place, death_place] <- [
      [
        1,
        "J.R.R.",
        "Tolkien",
        "1892-01-03",
        "1973-09-02",
        "Bloemfontein, Free State Province, South Africa",
        "Bournemouth, Dorset, England"
      ],
      [
        2,
        "Frank",
        "Herbert",
        "1920-10-08",
        "1986-02-11",
        "Tacoma, Washington, United States",
        "Madison, Wisconsin, United States"
      ],
      [
        3,
        "Agatha",
        "Christie",
        "1890-09-15",
        "1976-01-12",
        "Torquay, Devon, England",
        "Wallington, Surrey, England"
      ],
      [4, "Dan", "Brown", "1964-06-22", "", "Exeter, New Hampshire, United States", nil],
      [5, "Kristin", "Hannah", "1960-09-25", "", "Garden Grove, California, United States", nil],
      [
        6,
        "Jane",
        "Austen",
        "1775-12-16",
        "1817-07-18",
        "Steventon Rectory, Hampshire, England",
        "Winchester, Hampshire, England"
      ],
      [
        7,
        "Bram",
        "Stoker",
        "1847-11-08",
        "1912-04-20",
        "Clontarf, Dublin, Ireland",
        "London, England"
      ],
      [8, "Yuval Noah", "Harari", "1976-02-24", "", "Haifa, Israel", nil],
      [9, "Walter", "Isaacson", "1952-05-20", "", "New Orleans, Louisiana, United States", nil],
      [10, "Tara", "Westover", "1986-09-27", "", "Clifton, Idaho, United States", nil],
      [
        11,
        "Stephen R.",
        "Covey",
        "1932-10-24",
        "2012-07-16",
        "Salt Lake City, Utah, United States",
        "Provo, Utah, United States"
      ],
      [
        12,
        "Harper",
        "Lee",
        "1926-04-28",
        "2016-02-19",
        "Monroeville, Alabama, United States",
        "Monroeville, Alabama, United States"
      ],
      [13, "J.K.", "Rowling", "1965-07-31", "", "Yate, Gloucestershire, England", nil],
      [
        14,
        "Margaret Wise",
        "Brown",
        "1910-05-23",
        "1952-11-13",
        "Brooklyn, New York, United States",
        "Nice, Alpes-Maritimes, France"
      ],
      [15, "Rupi", "Kaur", "1992-10-05", "", "Hoshiarpur, Punjab, India", nil],
      [
        16,
        "Carl",
        "Sagan",
        "1934-11-09",
        "1996-12-20",
        "Brooklyn, New York, United States",
        "Seattle, Washington, United States"
      ],
      [17, "Daniel", "Kahneman", "1934-03-05", "", "Tel Aviv, Israel", nil],
      [
        18,
        "Marcus",
        "Aurelius",
        "0121-04-26",
        "0180-03-17",
        "Rome, Italy",
        "Vindobona, Roman Empire (modern-day Vienna, Austria)"
      ],
      [
        19,
        "Irma S.",
        "Rombauer",
        "1877-10-30",
        "1962-10-14",
        "St. Louis, Missouri, United States",
        "St. Louis, Missouri, United States"
      ],
      [20, "Paulo", "Coelho", "1947-08-24", "", "Rio de Janeiro, Brazil", nil],
      [21, "Jon", "Krakauer", "1954-04-12", "", "Brookline, Massachusetts, United States", nil],
      [
        22,
        "Gabriel",
        "García Márquez",
        "1927-03-06",
        "2014-04-17",
        "Aracataca, Magdalena, Colombia",
        "Mexico City, Mexico"
      ],
      [
        23,
        "Miguel",
        "de Cervantes",
        "1547-09-29",
        "1616-04-22",
        "Alcalá de Henares, Spain",
        "Madrid, Spain"
      ],
      [
        24,
        "Carlos",
        "Ruiz Zafón",
        "1964-09-25",
        "2020-06-19",
        "Barcelona, Spain",
        "Los Angeles, United States"
      ],
      [25, "Julio", "Cortázar", "1914-08-26", "1984-02-12", "Ixelles, Belgium", "Paris, France"],
      [
        26,
        "Isabel",
        "Allende",
        "1942-08-02",
        "",
        "Lima, Peru",
        nil
      ],
      [27, "Laura", "Esquivel", "1950-09-30", "", "Mexico City, Mexico", nil],
      [28, "Mario", "Vargas Llosa", "1936-03-28", "", "Arequipa, Peru", nil],
      [
        29,
        "Torcuato",
        "Luca de Tena",
        "1923-09-09",
        "1999-05-04",
        "Madrid, Spain",
        "Marbella, Spain"
      ]
    ] do
  {:ok, _} =
    Bookstore.People.create_author(%{
      id: id,
      name: name,
      surname: surname,
      born: born,
      dead: dead,
      birth_place: birth_place,
      death_place: death_place
    })
end

for attrs <- [
      %{
        title: "The Hobbit",
        authors_ids: ["1"],
        isbn: "978-0-618-00221-4",
        price: 15.99,
        pub_date: "1937-09-21",
        quantity: 5,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Houghton Mifflin Harcourt",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Fantasy"])
      },
      %{
        title: "Dune",
        authors_ids: ["2"],
        isbn: "978-0-441-17271-9",
        price: 12.75,
        pub_date: "1965-06-01",
        quantity: 8,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Ace Books",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Science Fiction"])
      },
      %{
        title: "Murder on the Orient Express",
        authors_ids: ["3"],
        isbn: "978-0-06-269366-2",
        price: 9.99,
        pub_date: "1934-01-01",
        quantity: 3,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "William Collins, Sons",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Mystery"])
      },
      %{
        title: "The Da Vinci Code",
        authors_ids: ["4"],
        isbn: "978-0-385-50420-5",
        price: 11.25,
        pub_date: "2003-03-18",
        quantity: 12,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Doubleday",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Thriller"])
      },
      %{
        title: "The Nightingale",
        authors_ids: ["5"],
        isbn: "978-1-250-01099-6",
        price: 14.50,
        pub_date: "2015-02-03",
        quantity: 6,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "St. Martin's Press",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Historical Fiction"])
      },
      %{
        title: "Pride and Prejudice",
        authors_ids: ["6"],
        isbn: "978-0-486-41236-2",
        price: 8.99,
        pub_date: "1813-01-28",
        quantity: 10,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "T. Egerton, Whitehall",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Romance"])
      },
      %{
        title: "Dracula",
        authors_ids: ["7"],
        isbn: "978-1-59308-347-4",
        price: 7.95,
        pub_date: "1897-05-26",
        quantity: 4,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Archibald Constable and Company",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Horror"])
      },
      %{
        title: "Sapiens: A Brief History of Humankind",
        authors_ids: ["8"],
        isbn: "978-0-06-231609-7",
        price: 20.00,
        pub_date: "2011-02-10",
        quantity: 7,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Harper",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Non-fiction", "History"])
      },
      %{
        title: "Steve Jobs",
        authors_ids: ["9"],
        isbn: "978-1-4516-4853-9",
        price: 13.75,
        pub_date: "2011-10-24",
        quantity: 2,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Simon & Schuster",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Biography", "Business"])
      },
      %{
        title: "Educated",
        authors_ids: ["10"],
        isbn: "978-0-399-59050-4",
        price: 16.99,
        pub_date: "2018-02-20",
        quantity: 9,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Random House",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Memoir"])
      },
      %{
        title: "The 7 Habits of Highly Effective People",
        authors_ids: ["11"],
        isbn: "978-1-4391-0153-3",
        price: 11.49,
        pub_date: "1989-08-15",
        quantity: 5,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Free Press",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Self-help"])
      },
      %{
        title: "To Kill a Mockingbird",
        authors_ids: ["12"],
        isbn: "978-0-06-112008-4",
        price: 9.25,
        pub_date: "1960-07-11",
        quantity: 8,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "J.B. Lippincott & Co.",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Classic", "Fiction"])
      },
      %{
        title: "Harry Potter and the Sorcerer's Stone",
        authors_ids: ["13"],
        isbn: "978-0-7475-3269-6",
        price: 14.95,
        pub_date: "1997-06-26",
        quantity: 3,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Bloomsbury",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Fantasy", "Young Adult"])
      },
      %{
        title: "Goodnight Moon",
        authors_ids: ["14"],
        isbn: "978-0-06-077585-8",
        price: 6.99,
        pub_date: "1947-09-03",
        quantity: 6,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Harper & Brothers",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Children's"])
      },
      %{
        title: "Milk and Honey",
        authors_ids: ["15"],
        isbn: "978-1-4494-9825-6",
        price: 10.99,
        pub_date: "2014-11-04",
        quantity: 4,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Andrews McMeel Publishing",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Poetry"])
      },
      %{
        title: "Cosmos",
        authors_ids: ["16"],
        isbn: "978-0-345-34681-9",
        price: 18.50,
        pub_date: "1980-10-01",
        quantity: 7,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Random House",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Science"])
      },
      %{
        title: "Thinking, Fast and Slow",
        authors_ids: ["17"],
        isbn: "978-0-374-27563-1",
        price: 14.25,
        pub_date: "2011-10-25",
        quantity: 2,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Farrar, Straus and Giroux",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Psychology"])
      },
      %{
        title: "Meditations",
        authors_ids: ["18"],
        isbn: "978-0-140-44523-5",
        price: 7.75,
        pub_date: "0180-01-01",
        quantity: 5,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Various",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Philosophy"])
      },
      %{
        title: "The Joy of Cooking",
        authors_ids: ["19"],
        isbn: "978-0-452-25665-2",
        price: 22.99,
        pub_date: "1931-01-01",
        quantity: 9,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Bobbs-Merrill Company",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Cooking"])
      },
      %{
        title: "The Alchemist",
        authors_ids: ["20"],
        isbn: "978-0-06-112241-5",
        price: 11.99,
        pub_date: "1988-01-01",
        quantity: 3,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "HarperOne",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Fiction"])
      },
      %{
        title: "Into the Wild",
        authors_ids: ["21"],
        isbn: "978-0-385-49476-2",
        price: 13.49,
        pub_date: "1996-01-01",
        quantity: 6,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Villard Books",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Travel", "Adventure"])
      },
      %{
        title: "Cien años de soledad",
        authors_ids: ["22"],
        isbn: "978-84-376-0494-7",
        price: 14.99,
        pub_date: "1967-05-30",
        quantity: 5,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Editorial Sudamericana",
        categories_ids:
          Bookstore.Catalog.list_categories_ids_by_title(["Magic Realism", "Literary Fiction"])
      },
      %{
        title: "Don Quijote de la Mancha",
        authors_ids: ["23"],
        isbn: "978-84-670-0023-3",
        price: 12.75,
        pub_date: "1605-01-01",
        quantity: 8,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Juan de la Cuesta",
        categories_ids: Bookstore.Catalog.list_categories_ids_by_title(["Classic", "Adventure"])
      },
      %{
        title: "La sombra del viento",
        authors_ids: ["24"],
        isbn: "978-84-322-1506-6",
        price: 11.49,
        pub_date: "2001-04-01",
        quantity: 6,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Editorial Planeta",
        categories_ids:
          Bookstore.Catalog.list_categories_ids_by_title(["Mystery", "Historical Fiction"])
      },
      %{
        title: "Rayuela",
        authors_ids: ["25"],
        isbn: "978-84-204-0225-2",
        price: 9.99,
        pub_date: "1963-07-28",
        quantity: 7,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Editorial Sudamericana",
        categories_ids:
          Bookstore.Catalog.list_categories_ids_by_title(["Experimental", "Literary Fiction"])
      },
      %{
        title: "La casa de los espíritus",
        authors_ids: ["26"],
        isbn: "978-84-663-1324-4",
        price: 13.25,
        pub_date: "1982-06-01",
        quantity: 4,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Plaza & Janés",
        categories_ids:
          Bookstore.Catalog.list_categories_ids_by_title(["Magical Realism", "Literary Fiction"])
      },
      %{
        title: "El amor en los tiempos del cólera",
        authors_ids: ["22"],
        isbn: "978-84-376-0194-6",
        price: 11.99,
        pub_date: "1985-05-15",
        quantity: 6,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Editorial Sudamericana",
        categories_ids:
          Bookstore.Catalog.list_categories_ids_by_title(["Romance", "Literary Fiction"])
      },
      %{
        title: "Como agua para chocolate",
        authors_ids: ["27"],
        isbn: "978-84-8306-030-0",
        price: 10.50,
        pub_date: "1989-01-01",
        quantity: 3,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Editorial Diana",
        categories_ids:
          Bookstore.Catalog.list_categories_ids_by_title(["Magic Realism", "Romance"])
      },
      %{
        title: "El laberinto de los espíritus",
        authors_ids: ["24"],
        isbn: "978-84-204-2703-4",
        price: 14.75,
        pub_date: "2016-11-17",
        quantity: 5,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Editorial Planeta",
        categories_ids:
          Bookstore.Catalog.list_categories_ids_by_title(["Mystery", "Historical Fiction"])
      },
      %{
        title: "La ciudad y los perros",
        authors_ids: ["28"],
        isbn: "978-84-9759-278-1",
        price: 12.99,
        pub_date: "1963-10-01",
        quantity: 7,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Editorial Losada",
        categories_ids:
          Bookstore.Catalog.list_categories_ids_by_title(["Literary Fiction", "Coming of Age"])
      },
      %{
        title: "Los renglones torcidos de Dios",
        authors_ids: ["29"],
        isbn: "978-84-663-0446-5",
        price: 9.25,
        pub_date: "1979-09-30",
        quantity: 4,
        img: "https://i.pinimg.com/originals/a0/69/7a/a0697af2de64d67cf6dbb2a13dbc0457.png",
        editor: "Plaza & Janés",
        categories_ids:
          Bookstore.Catalog.list_categories_ids_by_title(["Mystery", "Psychological Thriller"])
      }
    ] do
  {:ok, _} = Bookstore.Catalog.create_book(attrs)
end
