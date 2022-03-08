import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "next", "previous" ]

  next() {
    const next = this.nextTarget
    const previous = this.previousTarget

    next.classList.add("d-none")
    previous.classList.remove("d-none")
  }

  previous() {
    const next = this.nextTarget
    const previous = this.previousTarget

    next.classList.remove("d-none")
    previous.classList.add("d-none")
  }
}
