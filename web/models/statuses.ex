defmodule Sitback.Statuses do
  use Ecto.Model

  schema "statuses" do
    field :beacon_version_major, :string
    field :beacon_version_minor, :string
    field :user_name, :string
    field :distance, :string
  end
end
