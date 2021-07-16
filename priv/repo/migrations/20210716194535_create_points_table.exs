defmodule DoorApi.Repo.Migrations.CreatePointsTable do
  use Ecto.Migration

  def change do
    create table(:points) do
      add :name, :string
      add :mac_adress, :string
      add :ip_adress, :string
      add :level, :integer

      timestamps()
    end
    create unique_index(:points, [:mac_adress])
  end
end
