defmodule Sitback.StatusChannel do
  use Phoenix.Channel

  def join(socket, "status", message) do
    reply socket, "join", %{content: "joined status successfully"}
    {:ok, socket}
  end

  def join(socket, _no, _message) do
    reply socket, "join", %{content: "error occured"}
    {:error, socket, :unauthorized}
  end

  #def event(socket, "user:active", %{user_id: user_id}) do
  #  socket
  #end

  #def event(socket, "user:idle", %{user_id: user_id}) do
  #  socket
  #end

  #def event(socket, "incoming:event", message) do
  #  reply socket, "response:event", %{message: "Echo: " <> message.content}
  #  socket
  #end

  #def event(socket, "ping", message) do
  #  IO.puts "sending myself pong"
  #  IO.puts message["data"]
  #  broadcast socket, "pong", %{message: "Echo: " <> message["data"]}
  #  #send socket.pid, "pong"
  #  socket
  #end

  #def event(socket, "info", "pong") do
  #  IO.puts "Got pong from my own ping"
  #  socket
  #end
end
