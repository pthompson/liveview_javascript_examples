defmodule DemoWeb.CounterShadowViaEventsLive do
  use DemoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  def handle_event("increment", _params, socket) do
    {:noreply, update(socket, :count, &(&1 + 1))}
  end

  def handle_event("decrement", _params, socket) do
    {:noreply, update(socket, :count, &(&1 - 1))}
  end

  def render(assigns) do
    ~L"""
    <div id="counter"
     phx-hook="CounterShadowEvent"
     count=<%= @count %>
    <div x-data="{count: 0}" @count-updated="count = $event.detail.count">
    <h1>The assigns count is: <span><%= @count %></span></h1>
    <h1>The alpine count is: <span x-text="count"></span></h1>
    <button phx-click="decrement"> Decrement </button>
    <button phx-click="increment"> Increment </button>
    </div>
    </div>
    """
  end
end
