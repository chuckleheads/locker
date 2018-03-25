defmodule Locker.Origin do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]
  alias Locker.{Origin, Repo}

  schema "origins" do
    field :default_package_visibility, :string
    field :name, :string
    field :owner_id, :integer

    timestamps()
  end

  def with_name(name) do
    query = from o in Origin,
            where: o.name == ^name

    Repo.one(query)
  end

  @doc false
  def changeset(origin, attrs) do
    origin
    |> cast(attrs, [:name, :owner_id, :default_package_visibility])
    |> validate_required([:name])
  end
end
