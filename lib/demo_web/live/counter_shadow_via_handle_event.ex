defmodule DemoWeb.CounterShadowViaHandleEventLive do
  use DemoWeb, :live_view
  import Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  def handle_event("increment", _params, socket) do
    count = socket.assigns.count + 1

    {:noreply,
     socket
     |> assign(count: count)
     |> push_event("count-updated", %{count: count})}
  end

  def handle_event("decrement", _params, socket) do
    count = socket.assigns.count - 1

    {:noreply,
     socket
     |> assign(count: count)
     |> push_event("count-updated", %{count: count})}
  end

  def render(assigns) do
    ~L"""
    <div id="counter"
         phx-hook="CounterShadowHandleEvent"
         x-data="{count: 0}"
         x-on:count-updated="count = $event.detail.count">
      <h1>The assigns count is: <span><%= @count %></span></h1>
      <h1>The alpine count is: <span x-text="count"></span></h1>
      <button phx-click="decrement"> Decrement </button>
      <button phx-click="increment"> Increment </button>
    </div>
    """
  end
end
