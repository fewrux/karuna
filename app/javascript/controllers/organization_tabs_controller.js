import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="organization-tabs"
export default class extends Controller {
  static targets = ["main", "projects", "channels", "requests"]

  connect() {
    console.log("hello from tabs controller");
  }

  renderProjects() {
    this.projectsTarget.classList.add("active");
    this.channelsTarget.classList.remove("active");
    this.requestsTarget.classList.remove("active");
  }

  renderChannels() {
    this.projectsTarget.classList.remove("active");
    this.channelsTarget.classList.add("active");
    this.requestsTarget.classList.remove("active");
  }

  renderRequests() {
    this.projectsTarget.classList.remove("active");
    this.channelsTarget.classList.remove("active");
    this.requestsTarget.classList.add("active");
    console.log(this.requestsTarget.action);

    const url = `${this.requestsTarget.action}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.mainTarget.innerHTML = data
      })
  }
}
