import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", "availabilities" ]

  add() {
    const range = this.inputTarget.value
    const start_at = range.split(" to ")[0]
    const end_at = range.split(" to ")[1]

    const html = this.availabilitiesTarget.innerHTML
    this.availabilitiesTarget.innerHTML = html + "<br>" + range

    this.inputTarget.value = ""
  }

  remove() {
    this.inputTarget.value = ""
  }
}
