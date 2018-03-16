defmodule UM.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  import Supervisor.Spec

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: UM.Worker.start_link(arg)
      # {UM.Worker, arg},
      {UM.Repo, []},
      supervisor(Phoenix.PubSub.PG2, [:school_system, []]),
      supervisor(UserManagement.Channel, ["users"])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UM.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
