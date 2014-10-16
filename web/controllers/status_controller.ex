defmodule Sitback.StatusController do
  use Phoenix.Controller

  def test(conn, _params) do
    statuses = Sitback.Queries.statuses_query
    render conn, "test", statuses: statuses
  end

  def show(conn, _params) do
    status = Sitback.Queries.status_by_user_name(_params["user_name"])
    location = Sitback.Location.location_by_beacon_version(status.beacon_version_major, status.beacon_version_minor)
    json conn, JSON.encode! %{ user_name: status.user_name, distance: status.distance, location: location }
  end

  def create_or_update(conn, _params) do
    status = Sitback.Queries.status_by_user_name(_params["user_name"])
    create_or_update_status(_params, status)
    json conn, "{ \"status\": \"updated\" }"
  end

  defp create_or_update_status(params, nil) do
    status = %Sitback.Statuses{
      beacon_version_major: params["beacon_version_major"],
      beacon_version_minor: params["beacon_version_minor"],
      user_name: params["user_name"],
      distance: params["distance"]
    }
    Sitback.Repo.insert(status)
  end

  defp create_or_update_status(params, status) do
    status = %{status | beacon_version_major: params["beacon_version_major"],
      beacon_version_minor: params["beacon_version_minor"],
      distance: params["distance"]}
    Sitback.Repo.update(status)
  end
end
