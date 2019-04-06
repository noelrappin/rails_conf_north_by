import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["buttonText", "icon", "target"]

  hidden() {
    return this.data.get("hidden") === "true"
  }

  flipHidden() {
    this.data.set("hidden", this.hidden() ? "false" : "true")
  }

  toggle() {
    this.flipHidden()
    const svg = this.iconTarget.querySelector("svg")
    if (this.hidden()) {
      this.targetTarget.classList.add("is-hidden")
      svg.setAttribute("data-icon", "arrow-down")
      this.buttonTextTarget.innerText = "Show"
    } else {
      this.targetTarget.classList.remove("is-hidden")
      svg.setAttribute("data-icon", "arrow-up")
      this.buttonTextTarget.innerText = "Hide"
    }
  }
}
