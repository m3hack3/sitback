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
end
