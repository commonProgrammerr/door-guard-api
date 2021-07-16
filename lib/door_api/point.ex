defmodule DoorApi.Point do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "points" do
    field :name, :string
    field :mac_adress, :string
    field :ip_adress, :string
    field :level, :integer, default: 0

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:name, :mac_adress])
    |> validate_required([:name, :mac_adress])
    |> validate_length(:name, min: 3)
  end
end
