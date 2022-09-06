import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="organization-tabs"
export default class extends Controller {
  static targets = ["main", "projects", "channels", "requests"]

  connect() {
    console.log("hello from tabs controller");
  }

  setProjectsActive() {
    this.projectsTarget.classList.add("active");
    this.channelsTarget.classList.remove("active");
    this.requestsTarget.classList.remove("active");
  }

  setChannelsActive() {
    this.projectsTarget.classList.remove("active");
    this.channelsTarget.classList.add("active");
    this.requestsTarget.classList.remove("active");
  }

  setRequestsActive() {
    this.projectsTarget.classList.remove("active");
    this.channelsTarget.classList.remove("active");
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

  renderChannels(event) {
    event.preventDefault();

    this.setChannelsActive();
  }

  renderRequests(event) {
    event.preventDefault();

    this.setRequestsActive();

    console.log(this.requestsTarget.href);

    const url = `${this.requestsTarget.href}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.mainTarget.innerHTML = data
      })
  }
}
