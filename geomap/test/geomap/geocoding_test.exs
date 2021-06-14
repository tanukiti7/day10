defmodule Geomap.GeocodingTest do
  use Geomap.DataCase

  alias Geomap.Geocoding

  describe "locations" do
    alias Geomap.Geocoding.Location

    @valid_attrs %{lat: 120.5, lng: 120.5, locationName: "some locationName"}
    @update_attrs %{lat: 456.7, lng: 456.7, locationName: "some updated locationName"}
    @invalid_attrs %{lat: nil, lng: nil, locationName: nil}

    def location_fixture(attrs \\ %{}) do
      {:ok, location} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Geocoding.create_location()

      location
    end

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert Geocoding.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert Geocoding.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      assert {:ok, %Location{} = location} = Geocoding.create_location(@valid_attrs)
      assert location.lat == 120.5
      assert location.lng == 120.5
      assert location.locationName == "some locationName"
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Geocoding.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      assert {:ok, %Location{} = location} = Geocoding.update_location(location, @update_attrs)
      assert location.lat == 456.7
      assert location.lng == 456.7
      assert location.locationName == "some updated locationName"
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = Geocoding.update_location(location, @invalid_attrs)
      assert location == Geocoding.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = Geocoding.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> Geocoding.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = Geocoding.change_location(location)
    end
  end
end
