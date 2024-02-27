defmodule BookstoreWeb.DataFeed do
  @moduledoc """
  This module generates the data feed for Doofinder creating an index through the [Management API](https://docs.doofinder.com/api/management/v2/#tag/Indices/operation/index_create)

  Auth key : 4eef1ee1116ec75b7d2b51c2484791
  Search engine hash id (bookstore): cd1c15d769652a72ad6a8ad1654a2d07

  Request sample (POST):
  {
    "name": "product",
    "preset": "product",
    "options": {
      "exclude_out_of_stock_items": false
    },
    "datasources": [
      {
        "type": "file",
        "options": {
          "url": "https://yourserver/your_data_feed.xml"
        }
      }
    ]
  }
  """

  use BookstoreWeb, :controller

  plug :put_layout, false

  alias Bookstore.Catalog
  alias Bookstore.Catalog.Book
  alias Bookstore.Catalog.Category

  def index(conn, _params) do
    path =
      Path.join(
        Application.app_dir(:bookstore, "priv/static"),
        "datafeed.csv"
      )

    csv_content =
      "id;title;link;image_url;price;category;availability;authors;editor;isbn;pub_date\n" <>
        get_all_products()

    :ok = File.write(path, csv_content)

    conn
    |> put_resp_content_type("text/csv")
    |> send_file(:ok, path)
  end

  def get_all_products do
    Catalog.list_books()
    |> Enum.map_join("\n", &transform_book_to_product(&1))
  end

  @doc """
  The format for the file data feed is [defined by Doofinder](https://support.doofinder.com/managing-data/the-product-data-feed.html) as follows:
  Name 	Content 	Example 	Status
  id 	Unique identifier: a number, a string, or an alphanumeric string. It must be unique for every product. 	3253 	Mandatory
  title 	The name or title of the product. 	V-Neck T-Shirt 	Mandatory
  link 	Your product's landing page 	https://woocommerce.doofinder.com/index.php/product/v-neck-t-shirt/ 	Mandatory
  image_url 	Url link to the main image of your product. (preferably in .jpeg format) 	https://woocommerce.doofinder.com/index.php/product/v-neck-t-shirt/ 	Recommended
  price 	Selling price of the product. 	15.0 	Recommended
  category 	The category or type of the product (e.g., electronics, clothing, home & garden) 	Clothing > Tshirts 	Recommended
  availability 	Indicates if the product is in stock or out of stock. 	In stock 	Optional

  CSV headers: id, title, link, image_url, price, category, availability, authors, editor, isbn, pub_date
  """
  def transform_book_to_product(%Book{} = book) do
    "#{book.id};#{book.title};#{book_link(book)};#{get_image_link(book.img)};#{book.price};#{build_categories(book.categories)};#{get_availability(book.quantity)};#{authors(book)};#{book.editor};#{book.isbn};#{book.pub_date}"
  end

  @spec book_link(Book.t()) :: String.t()
  defp book_link(book) do
    "https://suddenly-mutual-catfish.ngrok-free.app" <> ~p"/books/#{book}"
  end

  @spec build_categories(list(Category.t())) :: String.t()
  defp build_categories(categories) do
    Enum.map_join(categories, " > ", & &1.title)
  end

  @spec get_availability(integer()) :: String.t()
  defp get_availability(0), do: "out of stock"
  defp get_availability(number) when number > 0, do: "in stock"

  @spec get_image_link(String.t()) :: String.t()
  defp get_image_link(link) do
    if String.starts_with?(link, "/uploads") do
      cover_name = String.trim_leading(link, "/uploads/")
      "https://suddenly-mutual-catfish.ngrok-free.app" <> "/cover/" <> cover_name
    else
      "https://suddenly-mutual-catfish.ngrok-free.app/cover/noimg"
    end
  end

  defp authors(%Book{} = book) do
    Enum.map_join(book.authors, ", ", &"#{&1.name} #{&1.surname}")
  end
end
