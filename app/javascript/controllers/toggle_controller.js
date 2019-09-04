import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["thingToHide", "text"]

  isHidden() { return this.data.get("hidden") === "true"  }

  flip() {   this.data.set("hidden", this.isHidden() ? "false" : "true") }

  toggle() {
    console.log("hi!")
    this.flip()
    this.thingToHideTarget.classList.toggle("is-hidden", this.isHidden())
    this.textTarget.innerText = this.isHidden() ? "Show" : "Hide"
  }
}
