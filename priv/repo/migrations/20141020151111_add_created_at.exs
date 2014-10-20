defmodule Sitback.Repo.Migrations.AddCreatedAt do
  use Ecto.Migration

  def up do
    ["ALTER TABLE statuses ADD created_at timestamp",
     "UPDATE statuses SET created_at = now()"
    ]
  end

  def down do
    ""
  end
end
