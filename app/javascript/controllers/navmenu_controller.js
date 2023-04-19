import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navmenu"
export default class extends Controller {
  connect() {
    $(this.element).dropdown();
  }
}
