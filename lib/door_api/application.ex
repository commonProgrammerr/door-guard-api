defmodule DoorApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      DoorApi.Repo,
      # Start the Telemetry supervisor
      DoorApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: DoorApi.PubSub},
      # Start the Endpoint (http/https)
      DoorApiWeb.Endpoint
      # Start a worker by calling: DoorApi.Worker.start_link(arg)
      # {DoorApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DoorApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    DoorApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
