defmodule DoorApi.Repo.Migrations.CreateAcessHistoryTable do
  use Ecto.Migration

  def change do
    create table(:acess_history) do
      add :user_id, references(:users, type: :binary_id, on_upadte: :update_all, on_delete: :delete_all)
      add :zone_id, references(:zones, type: :binary_id, on_upadte: :update_all, on_delete: :delete_all)
      add :point_id, references(:points, type: :binary_id, on_upadte: :update_all, on_delete: :delete_all)
      add :was_suceed, :boolean

      timestamps()
    end
  end

end
