defmodule Sitback.StatusController do
  use Phoenix.Controller

  def index(conn, _params) do
    render conn, "index"
  end

  def show(conn, _params) do
    text conn, "{ \"status\": \"received\" }"
  end

  def create_or_update(conn, _params) do
    text conn, "{ \"location_name\": \"トイレ\", \"user_name\": \"brian\", \"distance\": \"NEAR\" }"
  end
end
