defmodule Sitback.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def conf do
    # ECTO_URL example: sitback:sitback@localhost:5432/sitback
    parse_url "ecto://#{System.get_env("ECTO_URL")}"
  end

  def priv do
    app_dir(:sitback, "priv/repo")
  end
end
