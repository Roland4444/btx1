import Config

config :super_btrx, SuperBtrx.Endpoint,
  server: true,
  secret_key_base: "dummy_secret_key_base_1234567890abcdef"

config :super_btrx, :zakupay_token, ""


# Загружаем настройки для разработки
import_config "dev.exs"
