import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["dayBody", "dayButton"]

  dates() {
    return (this.data.get("visible") || "").split(",")
  }

  hasDate(date) {
    return this.dates().includes(date)
  }

  toggleDate(date) {
    const dates = this.dates()
    if (this.hasDate(date)) {
      for (let i = 0; i < dates.length; i += 1) {
        if (dates[i] === date) {
          dates.splice(i, 1)
        }
      }
    } else {
      dates.push(date)
    }
    this.data.set("visible", dates.join(","))
  }

  datesEmpty() {
    return this.dates().length === 1 && this.dates()[0] === ""
  }

  filterDate(event) {
    const date = event.currentTarget.dataset.date
    this.toggleDate(date)
    event.currentTarget.classList.toggle(
      "has-background-warning",
      this.hasDate(date)
    )
    this.updateDates(date)
  }

  updateDates() {
    this.dayBodyTargets.forEach(target => {
      const targetDate = target.id.split(":")[1]
      if (this.datesEmpty()) {
        target.classList.remove("is-hidden")
      } else {
        target.classList.toggle(
          "is-hidden",
          this.datesEmpty() || !this.hasDate(targetDate)
        )
      }
    })
  }

  showAll() {
    this.data.set("visible", "")
    this.dayButtonTargets.forEach(target => {
      target.classList.remove("has-background-warning")
    })
    this.updateDates()
  }
}
