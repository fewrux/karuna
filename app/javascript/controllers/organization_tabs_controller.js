import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="organization-tabs"
export default class extends Controller {
  static targets = ["main", "projects", "messages", "requests"]

  connect() {
    console.log("hello from organization tabs controller");
  }

  setProjectsActive() {
    this.projectsTarget.classList.add("active");
    this.messagesTarget.classList.remove("active");
    this.requestsTarget.classList.remove("active");
  }

  setMessagesActive() {
    this.projectsTarget.classList.remove("active");
    this.messagesTarget.classList.add("active");
    this.requestsTarget.classList.remove("active");
  }

  setRequestsActive() {
    this.projectsTarget.classList.remove("active");
    this.messagesTarget.classList.remove("active");
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

  renderMessages(event) {
    event.preventDefault();

    this.setMessagesActive();

    const url = `${this.messagesTarget.href}`
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
