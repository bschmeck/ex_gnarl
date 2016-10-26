defmodule ExGnarl.PageController do
  use ExGnarl.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
