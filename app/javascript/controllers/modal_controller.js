import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['firstModal', 'secondModal', 'thirdModal', 'fourthModal', 'medalModal', 'secondMedalModal']

  connect() {
    console.log("Hello from our first Stimulus controller")
    console.log(this.medalModalTarget)
  }
  openFirstModal() {
    this.firstModalTarget.style.display = "block";
  }
  openSecondModal() {
    this.secondModalTarget.style.display = "block";
  }
  openThirdModal() {
    this.thirdModalTarget.style.display = "block";
  }
  openFourthModal() {
    this.fourthModalTarget.style.display = "block";
  }
  openMedalModal() {
    this.medalModalTarget.style.display = "block";
  }
  openSecondMedalModal() {
    this.secondMedalModalTarget.style.display = "block";
  }
  closeFirstModal() {
    this.firstModalTarget.style.display = "none";
  }
  closeSecondModal() {
    this.secondModalTarget.style.display = "none";
  }
  closeThirdModal() {
    this.thirdModalTarget.style.display = "none";
  }
  closeFourthModal() {
    this.fourthModalTarget.style.display = "none";
  }
  closeMedalModal() {
    this.medalModalTarget.style.display = "none";
  }
  closeSecondMedalModal() {
    this.secondMedalModalTarget.style.display = "none";
  }
}
