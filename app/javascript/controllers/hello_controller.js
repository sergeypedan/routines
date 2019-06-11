import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["name", "output"]

  greet() {
    this.outputTarget.textContent = `Hello, ${this.nameTarget.value}!`
  }

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }
}
