defmodule BookstoreWeb.AuthorLiveTest do
  use BookstoreWeb.ConnCase

  import Phoenix.LiveViewTest
  import Bookstore.PeopleFixtures

  @create_attrs %{name: "some name", dead: "2024-02-12", surname: "some surname", born: "2024-02-12", birth_place: "some birth_place", death_place: "some death_place"}
  @update_attrs %{name: "some updated name", dead: "2024-02-13", surname: "some updated surname", born: "2024-02-13", birth_place: "some updated birth_place", death_place: "some updated death_place"}
  @invalid_attrs %{name: nil, dead: nil, surname: nil, born: nil, birth_place: nil, death_place: nil}

  defp create_author(_) do
    author = author_fixture()
    %{author: author}
  end

  describe "Index" do
    setup [:create_author]

    test "lists all authors", %{conn: conn, author: author} do
      {:ok, _index_live, html} = live(conn, ~p"/authors")

      assert html =~ "Listing Authors"
      assert html =~ author.name
    end

    test "saves new author", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/authors")

      assert index_live |> element("a", "New Author") |> render_click() =~
               "New Author"

      assert_patch(index_live, ~p"/authors/new")

      assert index_live
             |> form("#author-form", author: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#author-form", author: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/authors")

      html = render(index_live)
      assert html =~ "Author created successfully"
      assert html =~ "some name"
    end

    test "updates author in listing", %{conn: conn, author: author} do
      {:ok, index_live, _html} = live(conn, ~p"/authors")

      assert index_live |> element("#authors-#{author.id} a", "Edit") |> render_click() =~
               "Edit Author"

      assert_patch(index_live, ~p"/authors/#{author}/edit")

      assert index_live
             |> form("#author-form", author: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#author-form", author: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/authors")

      html = render(index_live)
      assert html =~ "Author updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes author in listing", %{conn: conn, author: author} do
      {:ok, index_live, _html} = live(conn, ~p"/authors")

      assert index_live |> element("#authors-#{author.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#authors-#{author.id}")
    end
  end

  describe "Show" do
    setup [:create_author]

    test "displays author", %{conn: conn, author: author} do
      {:ok, _show_live, html} = live(conn, ~p"/authors/#{author}")

      assert html =~ "Show Author"
      assert html =~ author.name
    end

    test "updates author within modal", %{conn: conn, author: author} do
      {:ok, show_live, _html} = live(conn, ~p"/authors/#{author}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Author"

      assert_patch(show_live, ~p"/authors/#{author}/show/edit")

      assert show_live
             |> form("#author-form", author: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#author-form", author: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/authors/#{author}")

      html = render(show_live)
      assert html =~ "Author updated successfully"
      assert html =~ "some updated name"
    end
  end
end
