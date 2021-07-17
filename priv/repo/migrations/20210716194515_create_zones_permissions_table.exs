defmodule DoorApi.Repo.Migrations.CreateZonesPermissionsTable do
  use Ecto.Migration

  def change do
    create table(:permissions, primary_key: false) do
      add :user_id, references(:users, type: :binary_id, on_upadte: :update_all, on_delete: :delete_all)
      add :zone_id, references(:zones, type: :binary_id, on_upadte: :update_all, on_delete: :delete_all)
      add :is_allowed, :boolean

      timestamps()
    end
  end
end
