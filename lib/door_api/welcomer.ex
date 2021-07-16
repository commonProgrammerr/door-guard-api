defmodule DoorApi.Welcomer do
  def welcome(params) do
    params["name"]
    |> String.trim()
    |> String.downcase()
    |> evaluate(params["age"] |> String.to_integer())
  end

  defp evaluate("banana", 42) do
    {:ok, "Hello banana, you are very especial!"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Hello #{name}!"}
  end

  defp evaluate(name, _age) do
    {:error, "You shall not pass, #{name}!"}
  end
end
