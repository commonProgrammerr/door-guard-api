defmodule DoorApi.Repo.Migrations.CreatePointsRelationZonesTable do
  use Ecto.Migration

  def change do
    create table(:points_zones, primary_key: false) do
      add :zone_id, references(:zones, type: :binary_id, on_upadte: :update_all, on_delete: :delete_all)
      add :point_id, references(:points, type: :binary_id, on_upadte: :update_all, on_delete: :delete_all)
      add :is_allowed, :boolean

      timestamps()
    end
  end
end
