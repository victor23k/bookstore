defmodule BookstoreWeb.CoverImg do
  use BookstoreWeb, :controller

  def index(conn, %{"name" => name}) do
    {:ok, img} = File.read(img_url(name))

    conn
    |> put_resp_header("Content-Disposition", "inline; #{name}")
    |> put_resp_content_type("image/webp")
    |> send_resp(:ok, img)
  end

  defp img_url(name) do
    Path.join(
      Application.app_dir(:bookstore, "priv/static/uploads"),
      name
    )
  end
end
