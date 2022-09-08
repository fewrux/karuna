import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="organization-tabs"
export default class extends Controller {
  static targets = ["main", "projects", "concluded", "requests"]

  connect() {
    console.log("hello from organization tabs controller");
  }

  setProjectsActive() {
    this.projectsTarget.classList.add("active");
    this.concludedTarget.classList.remove("active");
    this.requestsTarget.classList.remove("active");
  }

  setConcludedActive() {
    this.projectsTarget.classList.remove("active");
    this.concludedTarget.classList.add("active");
    this.requestsTarget.classList.remove("active");
  }

  setRequestsActive() {
    this.projectsTarget.classList.remove("active");
    this.concludedTarget.classList.remove("active");
    this.requestsTarget.classList.add("active");
  }

  renderProjects(event) {
    event.preventDefault();

    this.setProjectsActive();

    const url = `${this.projectsTarget.href}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.mainTarget.innerHTML = data
      })
  }

  renderConcluded(event) {
    event.preventDefault();

    this.setConcludedActive();

    const url = `${this.concludedTarget.href}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.mainTarget.innerHTML = data
      })
  }

  renderRequests(event) {
    event.preventDefault();

    this.setRequestsActive();

    const url = `${this.requestsTarget.href}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.mainTarget.innerHTML = data
      })
  }
}
