defmodule Sitback.Repo.Migrations.CreateStatuses do
  use Ecto.Migration

  def up do
    "CREATE TABLE statuses(id serial primary key, beacon_version_major varchar(100), beacon_version_minor varchar(100), user_name varchar(100), distance varchar(50))"
  end

  def down do
    "DROP TABLE statuses"
  end
end
