defmodule Sitback.Repo.Migrations.Index do
  use Ecto.Migration

  def up do
    "CREATE UNIQUE INDEX statuses_user_name_index ON statuses(user_name)"
  end

  def down do
    ""
  end
end
