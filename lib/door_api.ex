defmodule DoorApi do
  alias DoorApi.Points.Create, as: PointCreate
  alias DoorApi.Users.Create, as: UserCreate
  alias DoorApi.Zones.Create, as: ZoneCreate

  defdelegate create_user(parms), to: UserCreate, as: :call
  defdelegate create_zone(parms), to: ZoneCreate, as: :call
  defdelegate create_point(parms), to: PointCreate, as: :call
end
