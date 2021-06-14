defmodule Geomap.Repo do
  use Ecto.Repo,
    otp_app: :geomap,
    adapter: Ecto.Adapters.Postgres
end
