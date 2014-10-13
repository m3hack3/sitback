# This file is responsible for configuring your application
use Mix.Config

# Note this file is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project.

config :phoenix, Sitback.Router,
  port: System.get_env("PORT"),
  ssl: false,
  static_assets: true,
  cookies: true,
  session_key: "_sitback_key",
  session_secret: "%XI_MODICOK3L#V71UCY6L%1PPTUDOJ(XN4#S@19C$60RIXN(F4P78LG2XN81YY1PLO13^3",
  catch_errors: true,
  debug_errors: false,
  error_controller: Sitback.PageController

config :phoenix, :code_reloader,
  enabled: false

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. Note, this must remain at the bottom of
# this file to properly merge your previous config entries.
import_config "#{Mix.env}.exs"
