defmodule StackSupervisor.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc """
  The application module.
  """

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: StackSupervisor.Worker.start_link(arg)
      # {StackSupervisor.Worker, arg}
      {Stack, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StackSupervisor.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
