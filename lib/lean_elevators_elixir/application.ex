defmodule LeanElevatorsElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: LeanElevatorsElixir.Worker.start_link(arg)
      # {LeanElevatorsElixir.Worker, arg},
      Plug.Adapters.Cowboy.child_spec(:http, LeanElevatorsElixir, [], [port: 4001])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LeanElevatorsElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
