defmodule DoorApi.Repo.Migrations.CreateAcessHistoryTable do
  use Ecto.Migration

  def change do
    create table(:acess_history) do
      add :user_id, references(:users)
      add :zone_id, references(:zones)
      add :point_id, references(:points)
      add :was_suceed, :boolean

      timestamps()
    end
  end

end
