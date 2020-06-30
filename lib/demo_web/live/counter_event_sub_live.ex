defmodule DemoWeb.CounterEventSubLive do
  use DemoWeb, :live_view

  def mount(params, session, socket) do
    {:ok, assign(socket, id: socket.id)}
  end

  def render(assigns) do
    ~L"""
    <div id="sub-<%= @id %>"
         x-data="{count: 0}"
         @count-changed.window="count = $event.detail.count">
    <h1>The count in LiveView #<%= @id %> is:
      <span x-text="count"></span>
    </h1>
    </div>
    """
  end
end
