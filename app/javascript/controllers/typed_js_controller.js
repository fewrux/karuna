import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
 
  connect() {
    new Typed(this.element, {
      strings: ["Compassion is Action.", "अनुकम्पा अस्ति कार्य"],
      typeSpeed: 75,
      loop: true
    })
  }
}
