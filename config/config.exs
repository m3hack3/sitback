# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the router
config :phoenix, Sitback.Router,
  url: [host: "localhost"],
  http: [port: System.get_env("PORT")],
  https: false,
  secret_key_base: "GvGvVONjxPv3GAP5qcIW7IjJNaml3MNqBI3lASJZz/KTOOxFWkGvLfadcK0Mxixz+4d4/Er42PhUc+XP5OOEqQ==",
  catch_errors: true,
  debug_errors: false,
  error_controller: Sitback.PageController

# Session configuration
config :phoenix, Sitback.Router,
  session: [store: :cookie,
            key: "_sitback_key"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
