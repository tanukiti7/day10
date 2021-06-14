defmodule GeomapWeb.PageController do
  use GeomapWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
