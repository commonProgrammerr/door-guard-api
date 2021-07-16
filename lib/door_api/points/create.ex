defmodule DoorApi.Points.Create do
  alias DoorApi.{Repo, Point}

  def call(params) do
    params
    |> Point.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Point{}} = result), do: result

  defp handle_insert({:error, result}),
    do: {:error, %{result: result, status: :bad_request}}
end
