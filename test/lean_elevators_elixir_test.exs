defmodule LeanElevatorsElixirTest do
  use ExUnit.Case
  use Plug.Test
  doctest LeanElevatorsElixir

  @opts LeanElevatorsElixir.init([])

  test "GET /" do
    conn = conn(:get, "/")
    conn = LeanElevatorsElixir.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "This is a sample elevator."
  end

  test "POST /decide" do
    conn = conn(:post, "/decide")
    conn = LeanElevatorsElixir.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
  end
end
