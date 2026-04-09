defmodule SuperBtrx.PageController do
  use Phoenix.Controller

  def test(conn, _params) do
    request_params = %{
      "DIALOG_ID" => "chat8",
      "LAST_ID" => 32,
      "LIMIT" => 3
    }

    case SuperBtrx.BitrixClient.send_request(request_params) do
      {:ok, body} -> json(conn, body)
      {:error, status, body} -> conn |> put_status(status) |> json(%{error: "Bitrix error", details: body})
      {:error, reason} -> conn |> put_status(502) |> json(%{error: "HTTP error", reason: to_string(reason)})
    end
  end
end
