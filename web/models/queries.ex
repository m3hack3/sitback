defmodule Sitback.Queries do
  import Ecto.Query

  def statuses_query do
    query = from statuses in Sitback.Statuses, select: statuses
    Sitback.Repo.all(query)
  end
end
