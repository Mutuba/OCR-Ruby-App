import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Stimulse Controller running");
    this.element.textContent = "Hello World!";
  }
}
