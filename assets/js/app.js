import '../css/app.scss'
import 'phoenix_html'
import {
  Socket
} from 'phoenix'
import NProgress from 'nprogress'
import {
  LiveSocket
} from 'phoenix_live_view'
import Spruce from '@ryangjchandler/spruce'
import 'alpinejs'
Spruce.store('application', {
  count: 0
})
// Define hooks
const Hooks = {}
Hooks.LiveViewPushEventHook = {
  mounted() {
    const liveView = this
    this.liveViewPushEvent = function(e) {
      liveView.pushEvent(e.detail.event, e.detail.payload)
    }
    this.liveViewPushEventTo = function(e) {
      liveView.pushEventTo(e.detail.selector, e.detail.event, e.detail.payload)
    }
    window.addEventListener('liveview-push-event', this.liveViewPushEvent)
    window.addEventListener('liveview-push-event-to', this.liveViewPushEventTo)
  },
  destroyed() {
    window.removeEventListener('liveview-push-event', this.liveViewPushEvent)
    window.removeEventListener('liveview-push-event-to', this.liveViewPushEventTo)
  }
}
let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute('content')
let liveSocket = new LiveSocket('/live', Socket, {
  dom: {
    onBeforeElUpdated(from, to) {
      if (from.__x) {
        window.Alpine.clone(from.__x, to)
      }
    }
  },
  params: {
    _csrf_token: csrfToken
  },
  hooks: Hooks
})
// Show progress bar on live navigation and form submits
window.addEventListener('phx:page-loading-start', info => NProgress.start())
window.addEventListener('phx:page-loading-stop', info => NProgress.done())
// connect if there are any LiveViews on the page
liveSocket.connect()
// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)
window.liveSocket = liveSocket
