import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["text", "thingToHide"]

  isHidden() {
    return this.data.get("hidden") === "true"
  }

  flip() {
    this.data.set("hidden", this.isHidden() ? "false" : "true")
  }

  expectedText() {
    return this.isHidden() ? "Show" : "Hide"
  }

  toggle() {
    this.flip()
    this.thingToHideTarget.classList.toggle("is-hidden")
    this.textTarget.innerText = this.expectedText()
  }
}
