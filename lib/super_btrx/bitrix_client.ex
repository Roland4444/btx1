defmodule SuperBtrx.BitrixClient do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def send_request(params) do
    GenServer.call(__MODULE__, {:send, params})
  end

  @impl true
  def init(state), do: {:ok, state}

  @impl true
  def handle_call({:send, params}, _from, state) do
    url = "https://b24-6tfv6q.bitrix24.ru/rest/1/3ounnx4dgkjag64r/im.dialog.messages.get"
    headers = [{"Content-Type", "application/json"}]
    body = Jason.encode!(params)

    case Req.post(url, headers: headers, body: body) do
      {:ok, %{status: 200, body: body}} ->
        {:reply, {:ok, body}, state}

      {:ok, %{status: status, body: body}} ->
        {:reply, {:error, status, body}, state}

      {:error, reason} ->
        {:reply, {:error, reason}, state}
    end
  end
end
