defmodule SuperBtrx.Endpoint do
  use Phoenix.Endpoint, otp_app: :super_btrx

  plug Plug.Parsers, parsers: [:json], pass: ["application/json"], json_decoder: Jason
  plug SuperBtrx.Router
end
