defmodule Sitback.Router do
  use Phoenix.Router

  get "/", Sitback.PageController, :index, as: :pages

end
