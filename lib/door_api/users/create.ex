defmodule DoorApi.Users.Create do
  alias DoorApi.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{}} = result), do: result

  defp handle_insert({:error, result}),
    do: {:error, %{result: result, status: :bad_request}}
end
