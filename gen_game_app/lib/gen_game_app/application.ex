defmodule GenGameApp.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    topologies = Application.fetch_env!(:gen_game_app, :topologies)

    children = [
      {Cluster.Supervisor, [topologies, [name: GenGameApp.ClusterSupervisor]]},
      {Phoenix.PubSub, name: GenGame.PubSub},
      GenGameApp.Repo
    ]

    opts = [strategy: :one_for_one, name: GenGameApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
