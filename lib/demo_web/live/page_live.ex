defmodule DemoWeb.PageLive do
  use DemoWeb, :live_view

  def render(assigns) do
    ~L"""
    <section class="row">
      <article class="column">
        <h4>LiveView / Javascript Communication Examples</h4>
        <ul>
          <li><%= live_patch("Push Event Counter", to: Routes.live_path(@socket, DemoWeb.CounterPushEventLive)) %></li>
        </ul>
      </article>
    </section>
    """
  end

  def mount(_session, socket) do
    {:ok, socket}
  end

  def handle_params(_params, _uri, socket) do
    {:noreply, socket}
  end
end
