defmodule Geomap.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :lat, :float
      add :lng, :float
      add :locationName, :string

      timestamps()
    end

  end
end
