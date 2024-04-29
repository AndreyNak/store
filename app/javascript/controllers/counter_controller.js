import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    number: String
  }

  counting() {
    this.element.textContent = parseInt(this.element.textContent) + 1
  }
}
