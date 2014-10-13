use Mix.Config

config :phoenix, Sitback.Router,
  port: System.get_env("PORT") || 4000,
  ssl: false,
  host: "localhost",
  cookies: true,
  session_key: "_sitback_key",
  session_secret: "%XI_MODICOK3L#V71UCY6L%1PPTUDOJ(XN4#S@19C$60RIXN(F4P78LG2XN81YY1PLO13^3",
  debug_errors: true

config :phoenix, :code_reloader,
  enabled: true

config :logger, :console,
  level: :debug


