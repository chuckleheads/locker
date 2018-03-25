defmodule LockerWeb.Router do
  use LockerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LockerWeb do
    pipe_through :api

    post "/origins", OriginController, :create
    get "/origins/:name", OriginController, :show
  end
end
