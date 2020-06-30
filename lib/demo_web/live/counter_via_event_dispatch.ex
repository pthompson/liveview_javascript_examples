defmodule DemoWeb.CounterViaEventDispatchLive do
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
     phx-hook="LiveViewPushEvent"
     x-data="{}">
    <h1>The count is: <span><%= @count %></span></h1>
    <button @click="$dispatch('liveview-push-event', {
                    event: 'decrement',
                    payload: {}
                  })">
    Decrement
    </button>
        <button @click="$dispatch('liveview-push-event-to', {
                    selector: '#counter',
                    event: 'increment',
                    payload: {}
                  })">
    Increment
    </button>
    </div>
    """
  end
end
