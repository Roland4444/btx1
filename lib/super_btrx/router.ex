defmodule SuperBtrx.Router do
  use Phoenix.Router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api
    get "/test", SuperBtrx.PageController, :test
  end
end
