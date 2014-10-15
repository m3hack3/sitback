defmodule Sitback.Router do
  use Phoenix.Router

  get "/", Sitback.PageController, :index, as: :pages

  get "/statuses", Sitback.StatusController, :show
  post "/statuses", Sitback.StatusController, :create_or_update
end
