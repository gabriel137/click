defmodule ClickWeb.PageController do
  use ClickWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
