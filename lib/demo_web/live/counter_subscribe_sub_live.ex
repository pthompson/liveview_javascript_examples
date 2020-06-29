defmodule DemoWeb.CounterSubscribeSubLive do
  use DemoWeb, :live_view

  def mount(params, session, socket) do
    {:ok, assign(socket, id: socket.id)}
  end

  def render(assigns) do
    ~L"""
    <div id="sub-<%= @id %>"
         x-data="{}"
         x-subscribe>
    <h1>The stored count in LiveView #<%= @id %> is:
      <span x-text="$store.application.count"></span>
    </h1>

    """
  end
end
