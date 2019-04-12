import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["text", "thingToHide"]

  hidden() {
    return this.data.get("hidden") === "true"
  }

  flip() {
    this.data.set("hidden", this.hidden() ? "false" : "true")
  }

  expectedText() {
    return this.hidden() ? "Show" : "Hide"
  }

  toggle() {
    this.flip()
    this.thingToHideTarget.classList.toggle("is-hidden")
    this.textTarget.innerText = this.expectedText()
  }

}
