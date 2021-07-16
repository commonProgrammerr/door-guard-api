defmodule DoorApi.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:name, :email, :type, :acess_code]
  @required_admin_params [:name, :email, :type, :acess_code]
  @all_fields [
    :name,
    :type,
    :email,
    :acess_code,
    :acess_level,
    :is_active,
    :password
  ]

  schema "users" do
    field :name, :string
    field :type, :string, default: nil
    field :email, :string

    field :acess_code, :string
    field :acess_level, :integer, default: 0
    field :is_active, :boolean, default: true

    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  def changeset(params), do: handle_validate_requires(params)

  defp handle_validate_requires(%{type: "admin"} = params) do
    %__MODULE__{}
    |> cast(params, @all_fields)
    |> validate_required(@required_admin_params)
    |> validate_length(:name, min: 5)
    |> validate_format(:email, ~r/^[a-z0-9._]+@[a-z.]+[a-z]*(\.[a-z]+)$/)
    |> validate_length(:password, min: 6)
    |> put_password_hash()
  end

  defp handle_validate_requires(params) do
    %__MODULE__{}
    |> cast(params, @all_fields)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 5)
    |> validate_format(:email, ~r/^[a-z0-9._]+@[a-z.]+[a-z]*(\.[a-z]+)$/)
  end

  defp put_password_hash(
         %Changeset{
           valid?: true,
           changes: %{
             password: password
           }
         } = changeset
       ) do
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
