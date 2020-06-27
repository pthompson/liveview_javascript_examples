defmodule DemoWeb.CounterSubscribeSubLive do
  use DemoWeb, :live_view

  def mount(params, session, socket) do
    {:ok, assign(socket, id: socket.id)}
  end

  def render(assigns) do
    ~L"""
    <div id="sub"
        x-data="{}"
        x-subscribe>
      <h1>The stored count in subscriber <%= @id %> is: <span x-text="$store.application.count"></span></h1>
    </div>
    """
  end
end
