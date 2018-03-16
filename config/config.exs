use Mix.Config
config :user_management, ecto_repos: [UM.Repo]

config :user_management, UM.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "user_management",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
