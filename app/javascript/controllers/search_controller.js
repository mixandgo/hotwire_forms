import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Search connected");
  }

  submit() {
    console.log("Submit got called");
  }
}
