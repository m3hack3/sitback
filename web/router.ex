defmodule Sitback.Router do
  use Phoenix.Router
  use Phoenix.Router.Socket, mount: "/ws"

  scope "/" do
    # Use the default browser stack.
    pipe_through :browser

    get "/", Sitback.PageController, :index
    get "/status", Sitback.PageController, :status

    get "/statuses/test", Sitback.StatusController, :test
    get "/statuses", Sitback.StatusController, :show
    get "/statuses/histories", Sitback.StatusController, :histories
    post "/statuses", Sitback.StatusController, :insert_or_nothing
  end

  channel "channel", Sitback.StatusChannel

  # Other scopes may use custom stacks.
  # scope "/api" do
  #   pipe_through :api
  # end
end
