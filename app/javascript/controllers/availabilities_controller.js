import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = [ "container" ]

  connect() {
    console.log("AvailabilitiesController connected")
  }

  add(event) {
    event.preventDefault()
    const tripAvId = event.currentTarget.dataset.tripId
    const url = `/trip_availabilities/${tripAvId}/availabilities`

    fetch(url, {
      method: "POST",
      headers: { "Accept": "text/plain", "X-CSRF-Token": csrfToken() }
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data)
        this.containerTarget.innerHTML = data
      })
  }

  remove(event) {
    event.preventDefault()
    const tripAvId = event.currentTarget.dataset.tripId
    const avId = event.currentTarget.dataset.avId
    const url = `/trip_availabilities/${tripAvId}/availabilities/${avId}`

    fetch(url, {
      method: "DELETE",
      headers: { "Accept": "text/plain", "X-CSRF-Token": csrfToken() }
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data)
        this.containerTarget.innerHTML = data
      })
  }
}
