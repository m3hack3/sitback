defmodule Sitback.Repo.Migrations.RemoveIndex do
  use Ecto.Migration

  def up do
    "DROP INDEX statuses_user_name_index"
  end

  def down do
    ""
  end
end
