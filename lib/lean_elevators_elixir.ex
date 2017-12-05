defmodule LeanElevatorsElixir do
  use Plug.Router, async: true

  plug Plug.Parsers, parsers: [:json], json_decoder: Poison
  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "This is a sample elevator.")
  end

  post "/decide" do
    IO.puts inspect conn.body_params
    target_level = 1
    send_resp(conn, 200, Poison.encode!(target_level))
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end