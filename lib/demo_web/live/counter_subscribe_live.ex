defmodule DemoWeb.CounterSubscribeLive do
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
        x-data="{}"
        x-subscribe>
    <h1>The count is: <span><%= @count %></span></h1>
    <h1>The stored count is:
      <span x-text="$store.application.count"></span>
    </h1>
    <button phx-click="decrement"> Decrement </button>
    <button phx-click="increment"> Increment </button>
    </div>

    <template x-data="{count: <%= @count %>}"
            x-subscribe
            x-init="
              $watch('count', (value) => {
                $store.application.count = value
              })
            ">
    </template>
    """
  end
end
