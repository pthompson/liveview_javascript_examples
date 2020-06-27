defmodule DemoWeb.CounterPushEventLive do
  use DemoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  def handle_event("increment", params, socket) do
    IO.inspect(params, label: "PARAMS")
    {:noreply, update(socket, :count, &(&1 + 1))}
  end

  def handle_event("decrement", params, socket) do
    IO.inspect(params, label: "PARAMS")
    {:noreply, update(socket, :count, &(&1 - 1))}
  end

  def render(assigns) do
    ~L"""
    <div id="counter"
         phx-hook="LiveViewPushEventHook"
         x-data="{}">
      <h1>The count is: <span><%= @count %></span></h1>
      <button @click="$dispatch('liveview-push-event', {
                        event: 'increment',
                        payload: {}
                      })"> Increment </button>
      <button @click="$dispatch('liveview-push-event-to', {
                        selector: '#counter',
                        event: 'decrement',
                        payload: {}
                      })"> Decrement </button>
    </div>
    """
  end
end
