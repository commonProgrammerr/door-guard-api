defmodule DoorApi.Zone do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "zones" do
    field :name, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:name])
    |> validate_required([:name])
    |> validate_length(:name, min: 5)
  end
end
