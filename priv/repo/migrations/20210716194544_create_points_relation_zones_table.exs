defmodule DoorApi.Repo.Migrations.CreatePointsRelationZonesTable do
  use Ecto.Migration

  def change do
    create table(:points_zones, primary_key: false) do
      add :zone_id, references(:zones)
      add :point_id, references(:points)
      add :is_allowed, :boolean

      timestamps()
    end
  end
end
