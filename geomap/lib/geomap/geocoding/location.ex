defmodule Geomap.Geocoding.Location do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locations" do
    field :lat, :float
    field :lng, :float
    field :locationName, :string

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:lat, :lng, :locationName])
    |> validate_required([:lat, :lng, :locationName])
  end
end
