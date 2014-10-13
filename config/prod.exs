use Mix.Config

# NOTE: To get SSL working, you will need to set:
#
#     ssl: true,
#     keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#     certfile: System.get_env("SOME_APP_SSL_CERT_PATH"),
#
# Where those two env variables point to a file on disk
# for the key and cert

config :phoenix, Sitback.Router,
  port: System.get_env("PORT"),
  ssl: false,
  host: "example.com",
  cookies: true,
  session_key: "_sitback_key",
  session_secret: "%XI_MODICOK3L#V71UCY6L%1PPTUDOJ(XN4#S@19C$60RIXN(F4P78LG2XN81YY1PLO13^3"

config :logger, :console,
  level: :info,
  metadata: [:request_id]

