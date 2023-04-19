import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navmenu"
export default class extends Controller {
  connect() {
    var dropdown = this.element;
    $(dropdown).on('click', function(event) {
      $(this).dropdown('toggle');
    });

    $(dropdown).dropdown({ on: 'hover' });
  }
}
