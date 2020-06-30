defmodule DemoWeb.CounterEventPubLive do
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
         x-data="{count: <%= @count %>}"
         x-init="
           $watch('count', (value) => {
             $dispatch('count-changed', {count: value})
           })
         ">
      <h1>The count is: <span><%= @count %></span></h1>
      <%= live_render(@socket, DemoWeb.CounterEventSubLive, id: "1") %>
      <%= live_render(@socket, DemoWeb.CounterEventSubLive, id: "2") %>
      <button phx-click="decrement"> Decrement </button>
      <button phx-click="increment"> Increment </button>
    </div>
    """
  end
end
