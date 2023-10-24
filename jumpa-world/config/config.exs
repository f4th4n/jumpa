import Config

config :jumpa_world,
  topologies: [
    gossip: [
      strategy: Cluster.Strategy.Gossip,
      config: [
        secret: System.get_env("RELEASE_COOKIE", "gen_game")
      ]
    ]
  ]

config :jumpa_world,
  type: :world

config :logger, :console,
  level: :info
