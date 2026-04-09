defmodule Synteka.ApiClient do
  @config_key :zakupay_token

  def get_offers(opts \\ []) do
    count = Keyword.get(opts, :count, 10)
    state = Keyword.get(opts, :state, "DELETED")

    token = Application.get_env(:super_btrx, @config_key)
    unless token, do: raise("Token :zakupay_token not found in config")

    url = "https://restetris.cynteka.ru/api/v1/offers"
    headers = [{"accept", "application/json"}, {"ZakupayToken", token}]

    case Req.get(url, params: [count: count, state: state], headers: headers) do
      {:ok, %Req.Response{status: 200, body: body}} ->
        Jason.decode!(body)

      {:ok, %Req.Response{status: status}} ->
        raise("HTTP request failed with status #{status}")

      {:error, reason} ->
        raise("HTTP request failed: #{inspect(reason)}")
    end
  end
end
