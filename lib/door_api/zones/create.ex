defmodule DoorApi.Zones.Create do
  alias DoorApi.{Repo, Zone}

  def call(params) do
    params
    |> Zone.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Zone{}} = result), do: result

  defp handle_insert({:error, result}),
    do: {:error, %{result: result, status: :bad_request}}
end
