defmodule SuperBtrx.Application do
  use Application

  def start(_type, _args) do
    children = [
      SuperBtrx.BitrixClient,   # ваш HTTP-клиент
      SuperBtrx.Endpoint        # Phoenix endpoint
    ]
    opts = [strategy: :one_for_one, name: SuperBtrx.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
