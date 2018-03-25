defmodule Locker.Repo.Migrations.CreateOrigins do
  use Ecto.Migration

  def change do
    create table(:origins) do
      add :name, :string
      add :owner_id, :integer
      add :default_package_visibility, :string

      timestamps()
    end

  end
end
