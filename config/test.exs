use Mix.Config

# Configure your database
config :addressy_back, AddressyBack.Repo,
  username: "postgres",
  password: "postgres",
  database: "addressy_back_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :addressy_back, AddressyBackWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
