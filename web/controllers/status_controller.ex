defmodule Sitback.StatusController do
  use Phoenix.Controller
  require Logger

  plug :action

  alias Poison, as: JSON

  def test(conn, _params) do
    statuses = Sitback.Queries.statuses_query
    render conn, "test", statuses: statuses
  end

  def show(conn, params) do
    status = Sitback.Queries.last_status_by_user_name(params["user_name"])
    location = Sitback.Location.location_by_beacon_version(status.beacon_version_major, status.beacon_version_minor)
    json conn, JSON.encode! %{ user_name: status.user_name, distance: status.distance, location: location }
  end

  def histories(conn, params) do
    statuses = Sitback.Queries.statuses_by_user_name(params["user_name"], String.to_integer(params["limit"] || "10"))
      |> Enum.map fn(status) ->
        %{
          user_name: status.user_name, distance: status.distance,
          location: Sitback.Location.location_by_beacon_version(status.beacon_version_major, status.beacon_version_minor)
        }
      end
    json conn, JSON.encode! statuses
  end

  def insert_or_nothing(conn,params) do
    status = Sitback.Queries.last_status_by_user_name(params["user_name"])
    if (status == nil) || (status != nil && status_changed?(params, status)) do
      status = insert_status(params)
      Logger.info "INSERT_INFO: user_name: #{status.user_name}, major: #{status.beacon_version_major}, minor: #{status.beacon_version_minor}, distance: #{status.distance}"
      json conn, "{ \"status\": \"inserted\" }"
    else
      json conn, "{ \"status\": \"donothing\" }"
    end
  end

  defp status_changed?(params, status) do
    (params["beacon_version_major"] != status.beacon_version_major ||
     params["beacon_version_minor"] != status.beacon_version_minor ||
     params["distance"] != status.distance)
  end

  defp insert_status(params) do
    status = %Sitback.Statuses{
      beacon_version_major: params["beacon_version_major"],
      beacon_version_minor: params["beacon_version_minor"],
      user_name: params["user_name"],
      distance: params["distance"]
    }
    Sitback.Repo.insert(status)
    status
  end
end
