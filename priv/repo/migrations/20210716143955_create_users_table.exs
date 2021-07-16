defmodule DoorApi.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :type, :string
      add :email, :string
      add :is_active, :boolean
      add :acess_code, :string
      add :acess_level, :integer
      add :password_hash, :string

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:acess_code])
  end
end
