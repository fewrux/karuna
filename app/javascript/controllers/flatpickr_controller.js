import { Controller } from "@hotwired/stimulus"
import flatpickr from 'flatpickr';
import rangePlugin from 'flatpickr/dist/plugins/rangePlugin';

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ['firstRangeInput', 'secondRangeInput'];

  connect() {
    console.log(this.element);

    flatpickr(this.firstRangeInputTarget, {
      "plugins": [new rangePlugin({ input: this.secondRangeInputTarget })],
      dateFormat: "d M, Y"
    });
  }
}
