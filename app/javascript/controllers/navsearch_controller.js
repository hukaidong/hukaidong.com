import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="navsearch"
export default class extends Controller {
  static targets = ["form"]

  search(event) {
    event.preventDefault();

    if ($('#navsearch-content')[0].value !== "") {
      $('#navsearch-form').submit();
    } else {
      Logger.log("Nothing to search");
    }

  }

  onPostSuccess(event) {
    console.log("success!")
  }
}
