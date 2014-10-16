use Mix.Config

# ## SSL Support
#
# To get SSL working, you will need to set:
#
#     https: [port: 443,
#             keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#             certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables point to a file on
# disk for the key and cert.

config :phoenix, Sitback.Router,
  url: [host: "example.com"],
  http: [port: System.get_env("PORT")],
  secret_key_base: "GvGvVONjxPv3GAP5qcIW7IjJNaml3MNqBI3lASJZz/KTOOxFWkGvLfadcK0Mxixz+4d4/Er42PhUc+XP5OOEqQ=="

config :logger, :console,
  level: :info
