defmodule Sitback.StatusController do
  use Phoenix.Controller

  def test(conn, _params) do
    statuses = Sitback.Queries.statuses_query
    render conn, "test", statuses: statuses
  end

  def show(conn, _params) do
    text conn, "{ \"status\": \"received\" }"
  end

  def create_or_update(conn, _params) do
    text conn, "{ \"location_name\": \"トイレ\", \"user_name\": \"brian\", \"distance\": \"NEAR\" }"
  end
end
