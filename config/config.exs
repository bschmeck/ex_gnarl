# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ex_gnarl,
  ecto_repos: [ExGnarl.Repo]

# Configures the endpoint
config :ex_gnarl, ExGnarl.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yHIDy9+RVI41BYDO8Dz/oXkiD3PnR4qS0s5RvugItqyjk8skdqoTO9YsjYg95SA0",
  render_errors: [view: ExGnarl.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ExGnarl.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, [default_scope: "email"]}
  ]

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
