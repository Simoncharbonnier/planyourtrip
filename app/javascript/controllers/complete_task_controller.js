import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"


export default class extends Controller {
  static targets = [ "task" ]

  connect() {
    console.log("AvailabilitiesController connected")
  }

  done(event) {
    event.preventDefault()

    const id = event.currentTarget.dataset.id

    fetch(`/user_tasks/${id}/done`, {
      method: "PATCH",
      headers: { "Accept": "application/json" , "X-CSRF-Token": csrfToken()},
    })
      .then(response => response.json())
      .then((data) => {
        document.querySelector(".messages").insertAdjacentHTML("afterbegin", data.message)
        this.taskTarget.innerHTML = data.task
      })
  }
}
