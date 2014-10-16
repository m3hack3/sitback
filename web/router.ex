defmodule Sitback.Router do
  use Phoenix.Router

  scope "/" do
    # Use the default browser stack.
    pipe_through :browser

    get "/", Sitback.PageController, :index, as: :pages

    get "/statuses/test", Sitback.StatusController, :test
    get "/statuses", Sitback.StatusController, :show
    post "/statuses", Sitback.StatusController, :create_or_update
  end

  # Other scopes may use custom stacks.
  # scope "/api" do
  #   pipe_through :api
  # end
end
