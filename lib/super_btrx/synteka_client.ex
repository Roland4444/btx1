defmodule Synteka.ApiClient do
  @config_key :zakupay_token
  @base_url   "https://restetris.cynteka.ru"



  def get_offers(opts \\ []) do
    suffix = "/api/v1/offers"
    count = Keyword.get(opts, :count, 10)
    state = Keyword.get(opts, :state, "DELETED")

    token = Application.get_env(:super_btrx, @config_key)
    unless token, do: raise("Token :zakupay_token not found in config")

    url =  @base_url <> suffix
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



  # curl -X 'GET' \
  # 'https://zakupay-test.sel-be.ru/api/v1/api/v1/projects?page=12&pageSize=30&isoDate=true&ids=1&include=hierarchy&excludedIds=242&externalId=2&updatedTimeTo=1629374322166&updatedTimeFrom=1629374322166&changeActiveBudgetDateFrom=1629374322166&changeActiveBudgetDateTo=1629374322166' \
  # -H 'accept: application/json' \
  # -H 'ZakupayToken: <TOKEN_VALUE>'


  def get_projects(opts \\ []) do
    suffix = "/api/v1/projects"
    page_size = Keyword.get(opts, :page_size, 50)

    token = Application.get_env(:super_btrx, @config_key)
    unless token, do: raise("Token :zakupay_token not found in config")

    url = @base_url <> suffix

    headers = [{"accept", "application/json"}, {"ZakupayToken", token}]

    case Req.get(url, params: [pageSize: page_size], headers: headers) do
      {:ok, %Req.Response{status: 200, body: body}} ->
        Jason.decode!(body)

      {:ok, %Req.Response{status: status}} ->
        raise("HTTP request failed with status #{status}")

      {:error, reason} ->
        raise("HTTP request failed: #{inspect(reason)}")
    end
  end




  #   projects = Synteka.ApiClient.get_projects_raw()
  # iex(6)> projects["projects"] |> Enum.each(fn p -> IO.puts("#{p["id"]}: #{p["name"]}       >>>       :#{p["title"]}  ") end)
  def get_projects_raw(opts \\ []) do
    suffix = "/api/v1/projects"
    page_size = Keyword.get(opts, :page_size, 50)
    token = Application.get_env(:super_btrx, @config_key)
    unless token, do: raise("Token not found")
    url = @base_url <> suffix
    headers = [{"accept", "application/json"}, {"ZakupayToken", token}]
    case Req.get(url, params: [pageSize: page_size], headers: headers) do
      {:ok, %Req.Response{status: 200, body: body}} -> body
      {:ok, %Req.Response{status: status}} -> raise("HTTP #{status}")
      {:error, reason} -> raise("HTTP error: #{inspect(reason)}")
    end
  end


def get_offers_raw(opts \\ []) do
  suffix = "/api/v1/offers"
  count = Keyword.get(opts, :count, 10)
  state = Keyword.get(opts, :state, "DELETED")

  token = Application.get_env(:super_btrx, @config_key)
  unless token, do: raise("Token :zakupay_token not found in config")

  url = @base_url <> suffix
  headers = [{"accept", "application/json"}, {"ZakupayToken", token}]

  case Req.get(url, params: [count: count, state: state], headers: headers) do
    {:ok, %Req.Response{status: 200, body: body}} ->
      body   # уже декодировано (map или list)

    {:ok, %Req.Response{status: status}} ->
      raise("HTTP request failed with status #{status}")

    {:error, reason} ->
      raise("HTTP request failed: #{inspect(reason)}")
  end
end

@doc """


"""


end
