defmodule DemoWeb.PageLive do
  use DemoWeb, :live_view

  def render(assigns) do
    ~L"""
    <section class="row">
      <article class="column">
        <h4>LiveView / Javascript Communication Examples</h4>
        <ul>
          <li><%= live_patch("Counter", to: Routes.live_path(@socket, DemoWeb.CounterLive)) %></li>
          <li><%= live_patch("Counter via Hook", to: Routes.live_path(@socket, DemoWeb.CounterViaHookLive)) %></li>
          <li><%= live_patch("Push Event Counter", to: Routes.live_path(@socket, DemoWeb.CounterPushEventLive)) %></li>
          <li><%= live_patch("Counter Shadow", to: Routes.live_path(@socket, DemoWeb.CounterShadowAssignLive)) %></li>
          <li><%= live_patch("Counter Subscribe", to: Routes.live_path(@socket, DemoWeb.CounterSubscribeLive)) %></li>
          <li><%= live_patch("Counter PubSub", to: Routes.live_path(@socket, DemoWeb.CounterSubscribePubLive)) %></li>
          <li><%= live_patch("Counter Event Dispatch", to: Routes.live_path(@socket, DemoWeb.CounterViaEventDispatchLive)) %></li>
          <li><%= live_patch("Counter Shadow with Event", to: Routes.live_path(@socket, DemoWeb.CounterShadowViaEventsLive)) %></li>


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
