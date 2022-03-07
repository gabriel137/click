
defmodule ClickWeb.ShortLinkRedirectController do
  use ClickWeb, :controller

  alias Click.ShortLinks

  # GET /:key
  def index(conn, %{"key" => key}) do
    case ShortLinks.get_short_link_by_key(key) do
      nil ->
        conn
        |> put_flash(:error, "Invalid short link")
        |> redirect(to: "/")

      short_link ->
        Task.start(fn -> ShortLinks.increment_hit_count(short_link) end)
        redirect(conn, external: short_link.url)
    end
  end
end
