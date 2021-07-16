defmodule DoorApi.Repo.Migrations.CreateZonesPermissionsTable do
  use Ecto.Migration

  def change do
    create table(:permissions, primary_key: false) do
      add :user_id, references(:users)
      add :zone_id, references(:zones)
      add :is_allowed, :boolean

      timestamps()
    end
  end
end
