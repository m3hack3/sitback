defmodule Sitback.Queries do
  import Ecto.Query

  def statuses_query do
    query = from statuses in Sitback.Statuses, select: statuses
    Sitback.Repo.all(query)
  end

  def status_by_user_name(user_name) do
    query = from status in Sitback.Statuses,
      where: status.user_name == ^user_name,
      select: status
    Sitback.Repo.all(query) |> List.first
  end

  def last_status_by_user_name(user_name) do
    query = from status in Sitback.Statuses,
      order_by: [desc: status.id],
      where: status.user_name == ^user_name,
      select: status
    Sitback.Repo.all(query) |> List.first
  end

  def statuses_by_user_name(user_name, limit) do
    query = from status in Sitback.Statuses,
      order_by: [desc: status.id],
      where: status.user_name == ^user_name,
      select: status
    Sitback.Repo.all(query)
  end
end
