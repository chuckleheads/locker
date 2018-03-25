defmodule LockerWeb.OriginController do
  require Logger
  use LockerWeb, :controller
  alias Locker.{Origin, Repo}

  def create(conn, %{"name" => name}) do
    changeset = Origin.changeset(%Origin{}, %{name: name})
    {:ok, origin} = Repo.insert(changeset)

    conn
    |> put_status(:created)
    |> json(origin)
  end

  def show(conn, %{"name" => name}) do
    case Origin.with_name(name) do
      nil -> send_resp(conn, :not_found, "")
      origin -> json(conn, origin)
    end
  end
end
