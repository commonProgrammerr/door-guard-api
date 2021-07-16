defmodule DoorApi.Repo do
  use Ecto.Repo,
    otp_app: :door_api,
    adapter: Ecto.Adapters.Postgres
end
