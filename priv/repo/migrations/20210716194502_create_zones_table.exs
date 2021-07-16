defmodule DoorApi.Repo.Migrations.CreateZonesTable do
  use Ecto.Migration

  def change do
    create table(:zones) do
      add :name, :string

      timestamps()
    end

    create unique_index(:zones, [:name])
  end
end
